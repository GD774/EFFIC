package com.gd774.effic.service;

import java.sql.Date;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.ApprovalDto;
import com.gd774.effic.dto.approval.ApprovalMapDto;
import com.gd774.effic.dto.approval.DocDto;
import com.gd774.effic.dto.approval.DocItemDto;
import com.gd774.effic.mapper.ApprovalMapper;
import com.gd774.effic.util.AppPageUtils;
import com.gd774.effic.util.ApprovalMyFileUtils;
import com.gd774.effic.util.PageUtils;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
    private final ApprovalMapper approvalMapper;
	private final PageUtils PageUtils;
	private final AppPageUtils AppPageUtils;
    private final ApprovalMyFileUtils approvalMyFileUtils;
    
    public ApprovalServiceImpl(ApprovalMapper approvalMapper, PageUtils pageUtils, AppPageUtils appPageUtils, ApprovalMyFileUtils appMyFileUtils) {
		this.approvalMapper = approvalMapper;
		this.PageUtils = pageUtils;
		this.AppPageUtils = appPageUtils;
		this.approvalMyFileUtils = appMyFileUtils;
		
	}
    
    
    @Override
    @Transactional
    public int registerApproval(MultipartHttpServletRequest multipartRequest) {
    	
        // 필수 파라미터 추출
        String title = multipartRequest.getParameter("title");
        String contents = multipartRequest.getParameter("contents");
        int docTempCode;
        try {
            docTempCode = Integer.parseInt(multipartRequest.getParameter("docTempCode"));
        } catch (NumberFormatException e) {
            docTempCode = 1; // 기본값 설정
        }

        String docState = multipartRequest.getParameter("docState");

        // 세션에서 사용자 정보 추출
        UserDto user = (UserDto) multipartRequest.getSession().getAttribute("user");
        String empId = user.getEmpId();
        String depId = user.getDepId();

        // 긴급 여부 설정
        String urgentParam = multipartRequest.getParameter("urgent");
        String urgent = (urgentParam != null && urgentParam.equals("1")) ? "1" : "0";

        // AppDocDto 객체 생성
        AppDocDto appDoc = AppDocDto.builder()
                .empId(empId)
                .title(title)
                .contents(contents)
                .docTempCode(docTempCode)
                .depId(depId)
                .urgent(urgent)
                .docState(docState)
                .build();

        // 문서 등록 실행
        approvalMapper.insertAppDoc(appDoc);

        // 문서 추가 정보 등록 실행 (예: remarks, other)
        String remarks = multipartRequest.getParameter("remarks");
        String other = multipartRequest.getParameter("other");

        // 생성된 문서의 ID 가져오기
        int docId = appDoc.getDocId();

        // DocDto 객체 생성
        DocDto doc = DocDto.builder()
                .docId(docId)
                .remarks(remarks)
                .other(other)
                .build();

        // 문서 추가 정보 등록 실행
        approvalMapper.insertDoc(doc);

        // 여러 개의 아이템 처리
        String[] itemNames = multipartRequest.getParameterValues("itemName");
        String[] itemStandards = multipartRequest.getParameterValues("itemStandard");
        String[] itemQuans = multipartRequest.getParameterValues("itemQuan");
        String[] itemCosts = multipartRequest.getParameterValues("itemCost");
        String[] amounts = multipartRequest.getParameterValues("amount");

        if (itemNames != null) {
            for (int i = 0; i < itemNames.length; i++) {
                // DocItemDto 객체 생성
                DocItemDto docItem = DocItemDto.builder()
                        .docId(docId)
                        .itemName(itemNames[i])
                        .itemStandard(itemStandards[i])
                        .itemQuan(itemQuans[i])
                        .itemCost(itemCosts[i])
                        .amount(amounts[i])
                        .build();

                // 문서 아이템 등록 실행
                approvalMapper.insertDocItem(docItem);
            }
        }
        
        String appState = multipartRequest.getParameter("appState");
        String reject = multipartRequest.getParameter("reject");
        String lineOrder = multipartRequest.getParameter("lineOrder");
        String appDocId = multipartRequest.getParameter("appDocId");
        
        ApprovalDto approval = ApprovalDto.builder()
        		.docId(docId)
        		.appState(appState)
        		.reject(reject)
        		.lineOrder(lineOrder)
        		.appDocId(appDocId)
        		.build();
        
        approvalMapper.registerToApp(approval);
        

        return docId; // 문서 등록된 ID 반환
    
}
    
    
    @Override
    public void loadMyDocList(HttpServletRequest request, Model model) {
	    UserDto user = (UserDto) request.getSession().getAttribute("user");

	    String empId = user.getEmpId();
	    String depId = user.getDepId();
	    
	    Map<String, Object> map = new HashMap<>();
	    
	    map.put("empId", empId);
	    map.put("depId", depId);
	    
	    List<AppDocDto> myDocList = approvalMapper.getMyDocList(map);
	    model.addAttribute("myDocList", myDocList);
    }

    
    @Override
    public void loadMyTemporaryList(HttpServletRequest request, Model model) {
	    // 세션에서 사용자 정보를 가져옵니다.
	    UserDto user = (UserDto) request.getSession().getAttribute("user");

	    String empId = user.getEmpId();
	    String depId = user.getDepId();
	    
	    Map<String, Object> map = new HashMap<>();
	    
	    map.put("empId", empId);
	    map.put("depId", depId);
	    map.put("docState", 3); 
	    
	    List<AppDocDto> tempSavedDocs = approvalMapper.getMyDocListByDocState(map);
	    model.addAttribute("tempSavedDocs", tempSavedDocs);	
    }
    
    
    @Override
    public void loadDepDocList(HttpServletRequest request, Model model) {
	    // 세션에서 사용자 정보를 가져옵니다.
	    UserDto user = (UserDto) request.getSession().getAttribute("user");

	    String empId = user.getEmpId();
	    String depId = user.getDepId();
	    
	    Map<String, Object> map = new HashMap<>();
	    
	    map.put("empId", empId);
	    map.put("depId", depId);
	    map.put("docState", 1); 
	    
	    List<AppDocDto> depDocList = approvalMapper.getDepDocListByDocState(map);
	    model.addAttribute("depDocList", depDocList);	
    	
    }
    
    
    @Override
    public ApprovalMapDto docById(int docId) {
    	return approvalMapper.getDocById(docId);
    }
    
    @Override
    public List<DocItemDto> docItemsByDocId(int docId) {
    	
    	return approvalMapper.getItemsByDocId(docId);
    }
    

    
    
    
    
}
	    
    
    

