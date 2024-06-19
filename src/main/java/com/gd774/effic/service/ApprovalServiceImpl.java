package com.gd774.effic.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.ApprovalDto;
import com.gd774.effic.dto.approval.DocDto;
import com.gd774.effic.dto.approval.DocItemDto;
import com.gd774.effic.mapper.ApprovalMapper;
import com.gd774.effic.util.AppPageUtils;
import com.gd774.effic.util.ApprovalMyFileUtils;
import com.gd774.effic.util.PageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
        
        // 세션에서 사용자 정보 추출
        UserDto user = (UserDto) multipartRequest.getSession().getAttribute("user");
        String empId = user.getEmpId();
        String depId = user.getDepId();
        
        // 필수 파라미터 추출
        String title = multipartRequest.getParameter("title");
        int docTempCode;
        try {
            docTempCode = Integer.parseInt(multipartRequest.getParameter("docTempCode"));
        } catch (NumberFormatException e) {
            docTempCode = 1; // 기본값 설정
        }

        // 긴급 여부 설정
        String urgentParam = multipartRequest.getParameter("urgent");
        String urgent = (urgentParam != null && urgentParam.equals("1")) ? "1" : "0";
        
        String docState = multipartRequest.getParameter("docState");

        // AppDocDto 객체 생성
        AppDocDto appDoc = AppDocDto.builder()
                .empId(empId)
                .title(title)
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
        
        if ("0".equals(docState)) { 
            String drafter = user.getEmpId();
            String approver = multipartRequest.getParameter("approver");
            // ApprovalDto 객체 생성
            ApprovalDto approvalDto = ApprovalDto.builder()
                    .docId(docId)
                    .drafter(empId)
                    .approver(approver)
                    .build();
            
            // 결재자 정보 등록 실행
            approvalMapper.insertApprovalLine(approvalDto);       
        }
        
        return docId; // 문서 등록된 ID 반환
    }
    
    
    
//    @Override
//    public void loadMyDocList(HttpServletRequest request, Model model) {
//	    UserDto user = (UserDto) request.getSession().getAttribute("user");
//
//	    String empId = user.getEmpId();
//	    String depId = user.getDepId();
//	    
//	    Map<String, Object> map = new HashMap<>();
//	    
//	    map.put("empId", empId);
//	    map.put("depId", depId);
//	    
//	    List<AppDocDto> myDocList = approvalMapper.getMyDocList(map);
//	    model.addAttribute("myDocList", myDocList);
//	    
//	    
//    }
    
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
    public void loadMySaveDocList(HttpServletRequest request, Model model) {
	    // 세션에서 사용자 정보를 가져옵니다.
	    UserDto user = (UserDto) request.getSession().getAttribute("user");

	    String empId = user.getEmpId();
	    String depId = user.getDepId();
	    
	    Map<String, Object> map = new HashMap<>();
	    
	    map.put("empId", empId);
	    map.put("depId", depId);
	    map.put("docState", 3); 
	    
	    List<AppDocDto> mySaveDocList = approvalMapper.getMySaveDocList(map);
	    model.addAttribute("mySaveDocList", mySaveDocList);	
    }
    
    @Override
    public void loadMyAppDocList(HttpServletRequest request, Model model) {
    	
    	UserDto user = (UserDto) request.getSession().getAttribute("user");
    	
    	String approver = user.getEmpId();
    	String depId = user.getDepId();
    	
    	Map<String, Object> map = new HashMap<>();
    	
    	map.put("empId", approver);
    	
    	List<AppDocDto> myAppDocList = approvalMapper.getMyAppDocList(map);
	    model.addAttribute("myAppDocList", myAppDocList);	
    	
    }
    
    // 결재자가 결재를 위해 문서 상세보기
    @Override
    public void detailDocByDocId(HttpServletRequest request, Model model) {
    	UserDto user = (UserDto) request.getSession().getAttribute("user");

    	String drafter = user.getEmpId();
	    String approver = user.getEmpId();    
	    String docId = request.getParameter("docId");
	    String docState = request.getParameter("docState");
	    
	    String depId = user.getDepId();
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("empId", approver);
	    map.put("docId", docId);
	    map.put("docState", docState);
	    
	    List<AppDocDto> detailDoc = approvalMapper.getDocByDocId(map);
	    model.addAttribute("detailDoc", detailDoc);	
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
	    
	    List<AppDocDto> depDocList = approvalMapper.getDepDocList(map);
	    model.addAttribute("depDocList", depDocList);	
    	
    }

 
    @Override
    public void modifyDoc(AppDocDto appDocDto, DocDto docDto, DocItemDto docItemDto, ApprovalDto approvalDto) {
        int appDocResult = approvalMapper.updateAppDoc(appDocDto);
        int docResult = approvalMapper.updateDoc(docDto);
        int docItemResult = approvalMapper.updateDocItem(docItemDto);
        int approvalResult = approvalMapper.updateApproval(approvalDto);


    }

    
	   @Override
	public AppDocDto getDocById(int docId) {
		
		return approvalMapper.getDocById(docId);
	}
 
	@Override
	public List<AppDocDto> myDocListUserMain(HttpServletRequest request, Model model) {
		UserDto user = (UserDto) request.getSession().getAttribute("user");
	    String empId = user.getEmpId();
	    String depId = user.getDepId();
	    
	    Map<String, Object> map = new HashMap<>();
	    
	    map.put("empId", empId);
	    map.put("depId", depId);
    	return approvalMapper.getMyDocList(map);
	}
	   
    
}
	    
    
    

