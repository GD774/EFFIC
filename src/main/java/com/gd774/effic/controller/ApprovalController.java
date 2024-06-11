package com.gd774.effic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.service.ApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {

    private final ApprovalService approvalService;
    
    @Autowired
    public ApprovalController(ApprovalService approvalService) {
        this.approvalService = approvalService;
    }
    
    // 전자결재 메인페이지
    @GetMapping("/main")
    public String approvalMain() {
        return "approval/main";
    }
    
    // 전자결재 개인기안문서함
    @GetMapping("/myDocList.page")
    public String goMyDocList() {
        return "approval/myDocList";
    }
    
    // 전자결재 개인임시저장함
    @GetMapping("/temporaryList.page")
    public String goTemporaryList() {
        return "approval/temporaryList";
    }
    
    // 전자결재 개인참조문서함
    @GetMapping("/myRefList.page")
    public String goMyRefList() {
        return "approval/myRefList";
    }
    
    // 전자결재 개인결재문서함
    @GetMapping("/myAppDocList.page")
    public String goMyAppDocList() {
        return "approval/myAppDocList";
    }
    
    // 전자결재 부서기안완료함
    @GetMapping("/depDocList.page")
    public String goDepDocList() {
        return "approval/depDocList";
    }
    
    // 전자결재 부서참조문서함
    @GetMapping("/depRefList.page")
    public String goDepRefList() {
        return "approval/depRefList";
    }
    
    @GetMapping("/test.page")
    public String goTest() {
    	return "approval/test";
    }
    

    @GetMapping("/docTemp1.page")
    public String goWrite() {
        return "approval/docTemp";
    }

    @PostMapping("/registerApproval")
    public String registerApproval(MultipartHttpServletRequest multipartRequest) {
        approvalService.registerApproval(multipartRequest);
        return "redirect:/approval/docDetail.page"; // 성공 페이지로 리다이렉트
    }                   
}