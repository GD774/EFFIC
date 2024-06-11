package com.gd774.effic.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.dto.approval.AppAttachDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.DocDto;
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
    public int registerApproval(MultipartHttpServletRequest multipartRequest) {
        // 기안 정보 파라미터에서 가져오기
        String title = multipartRequest.getParameter("title");
        String contents = multipartRequest.getParameter("contents");
        int docTempCode = Integer.parseInt(multipartRequest.getParameter("docTempCode"));
        int depId = Integer.parseInt(multipartRequest.getParameter("depId"));
        String urgent = multipartRequest.getParameter("urgent");
        String docState = multipartRequest.getParameter("docState");  // 진행 상태

        // 세션에서 사용자 정보 가져오기
        UserDto user = (UserDto) multipartRequest.getSession().getAttribute("user");
        String empId = user.getEmpId();

        // AppDocDto 객체 생성 및 기안 등록
        AppDocDto approval = AppDocDto.builder()
                .empId(empId)
                .title(title)
                .contents(contents)
                .docTempCode(docTempCode)
                .depId(depId)
                .docState(docState)
                .urgent(urgent)
                .build();

        approvalMapper.registerApproval(approval);

        // 문서 템플릿 추가
        String itemName = multipartRequest.getParameter("itemName");
        String itemStandard = multipartRequest.getParameter("itemStandard");
        int itemQuan = Integer.parseInt(multipartRequest.getParameter("itemQuan"));
        int itemCost = Integer.parseInt(multipartRequest.getParameter("itemCost"));
        int amount = Integer.parseInt(multipartRequest.getParameter("amount"));
        String remarks = multipartRequest.getParameter("remarks");

        DocDto docTemplate = DocDto.builder()
                .docId(approval.getDocId()) // 등록된 기안의 docId를 사용
                .itemName(itemName)
                .itemStandard(itemStandard)
                .itemQuan(itemQuan)
                .itemCost(itemCost)
                .amount(amount)
                .remarks(remarks)
                .build();
        approvalMapper.insertDoc(docTemplate);
        
//        System.out.println("INSERT 이전 : " + approval.);  // uploadNo 없음
//        int insertUploadCount = approvalMapper.registerApproval(approval);
//        System.out.println("INSERT 이후 : " + upload.getUploadNo());

        // 첨부 파일 처리하기
        List<MultipartFile> files = multipartRequest.getFiles("files");
        int insertAttachCount = 0;

        for (MultipartFile multipartFile : files) {
            if (multipartFile != null && !multipartFile.isEmpty()) {
                try {
                    String uploadPath = approvalMyFileUtils.getUploadPath();
                    File dir = new File(uploadPath);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    String originalFilename = multipartFile.getOriginalFilename();
                    String filesystemName = approvalMyFileUtils.getFilesystemName(originalFilename);
                    File file = new File(dir, filesystemName);

                    multipartFile.transferTo(file);

                    // 첨부 파일 정보를 데이터베이스에 저장하기
                    AppAttachDto appAttach = AppAttachDto.builder()
                            .uploadPath(uploadPath)
                            .filesystemName(filesystemName)
                            .originalfilename(originalFilename)
                            .docId(approval.getDocId())
                            .build();
                    approvalMapper.insertAttach(appAttach);

                    insertAttachCount++;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        // 기안 및 첨부 파일 처리 결과 반환
        return 1;
    }

    // 기타 서비스 메서드들...
}
