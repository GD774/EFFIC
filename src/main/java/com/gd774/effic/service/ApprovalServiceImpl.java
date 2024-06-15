package com.gd774.effic.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.DocDto;
import com.gd774.effic.dto.approval.DocItemDto;
import com.gd774.effic.mapper.ApprovalMapper;
import com.gd774.effic.util.ApprovalMyFileUtils;
import com.gd774.effic.util.PageUtils;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
    private final ApprovalMapper approvalMapper;
    private final PageUtils pageUtils;
    private final ApprovalMyFileUtils approvalMyFileUtils;

    // 생성자를 통한 의존성 주입
    public ApprovalServiceImpl(ApprovalMapper approvalMapper, PageUtils pageUtils, ApprovalMyFileUtils myFileUtils) {
        super();
    	this.approvalMapper = approvalMapper;
        this.pageUtils = pageUtils;
        this.approvalMyFileUtils = myFileUtils;
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
            docTempCode = 1;
        }
        String docState = multipartRequest.getParameter("docState");

        // 세션에서 사용자 정보 추출
        UserDto user = (UserDto) multipartRequest.getSession().getAttribute("user");
        String empId = user.getEmpId();
        String depId = user.getDepId();

        // 긴급 여부 설정
        String urgent = multipartRequest.getParameter("urgent");

        // AppDocDto 객체 생성
        AppDocDto appDoc = AppDocDto.builder()
                .empId(empId)
                .title(title)
                .contents(contents)
                .docTempCode(docTempCode)
                .depId(depId)
                .urgent(urgent)
                .build();

        // 문서 등록 실행
        approvalMapper.registerApproval(appDoc);

        approvalMapper.selectDocId(empId, depId, title);
        
        // 생성된 문서의 ID 가져오기
        int docId = appDoc.getDocId();
        

        // 문서 추가 정보 등록 실행 (예: remarks, other)
        String remarks = multipartRequest.getParameter("remarks");
        String other = multipartRequest.getParameter("other");

        // DocDto 객체 생성
        DocDto docTemplate = DocDto.builder()
                .docId(docId)
                .remarks(remarks)
                .other(other)
                .build();

        // 문서 추가 정보 등록 실행
        approvalMapper.insertDoc(docTemplate);

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

        return docId; // 문서 등록된 ID 반환
    }
    
    @Override
    public List<Map<String, Object>> getMyDocList() {
    	return approvalMapper.getMyDocList();
    }

    
    

    
//    @Override
//    public void loadUploadList(Model model) {
//    	Map<String, Object> modelMap = model.asMap();
//        HttpServletRequest request = (HttpServletRequest) modelMap.get("request");
//        
//        int total = uploadMapper.getUploadCount();
//        
//        Optional<String> optDisplay = Optional.ofNullable(request.getParameter("display"));
//        int display = Integer.parseInt(optDisplay.orElse("20"));
//        
//        Optional<String> optPage = Optional.ofNullable(request.getParameter("page"));
//        int page = Integer.parseInt(optPage.orElse("1"));
//
//        myPageUtils.setPaging(total, display, page);
//        
//        Optional<String> optSort = Optional.ofNullable(request.getParameter("sort"));
//        String sort = optSort.orElse("DESC");
//        
//        Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
//                                       , "end", myPageUtils.getEnd()
//                                       , "sort", sort);
//        
//        /*
//         * total = 100, display = 20
//         * 
//         * page  beginNo
//         * 1     100
//         * 2     80
//         * 3     60
//         * 4     40
//         * 5     20
//         */
//        model.addAttribute("beginNo", total - (page - 1) * display);
//        model.addAttribute("uploadList", uploadMapper.getUploadList(map));
//        model.addAttribute("paging", myPageUtils.getPaging(request.getContextPath() + "/upload/list.do", sort, display));
//        model.addAttribute("display", display);
//        model.addAttribute("sort", sort);
//        model.addAttribute("page", page);
//    	
//    }
//    
//    @Override
//    public void loadUploadByNo(int uploadNo, Model model) {
//	    model.addAttribute("upload", uploadMapper.getUploadByNo(uploadNo));
//	    model.addAttribute("attachList", uploadMapper.getAttachList(uploadNo));
//    	
//    }
//    
//	@Override
//	public ApprovalDto getUploadByNo(int uploadNo) {
//		return uploadMapper.getUploadByNo(uploadNo);
//		
	}
	    
    
    

