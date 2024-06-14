package com.gd774.effic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import com.gd774.effic.dto.DepDto;
import com.gd774.effic.dto.UserDto;
import com.gd774.effic.service.ApprovalService;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
    

    @GetMapping("/writeDoc.page")
    public String goWrite(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        UserDto user = (UserDto) session.getAttribute("user");
        return "approval/writeDoc";
    }

    @PostMapping("/register.do")
    public String registerApproval(MultipartHttpServletRequest multipartRequest
    							 , RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("inserted", approvalService.registerApproval(multipartRequest));
        
        return "redirect:/approval/main"; // 성공 페이지로 리다이렉트
    }     
    
    @GetMapping("/myDocList.do")
    public String myDocList(Model model) {
        List<Map<String, Object>> myDocList = approvalService.getMyDocList();
        model.addAttribute("myDocList", myDocList);
        return "approval/myDocList.page";
    }
    
    
 
    
//    @GetMapping("/detail.do")
//    public String detail(@RequestParam(value="uploadNo", required=false, defaultValue="0") int uploadNo
//                       , Model model) {
//      uploadService.loadUploadByNo(uploadNo, model);
//      return "upload/detail";
//    }
//    
//    @GetMapping("/list.do")
//    public String list(HttpServletRequest request, Model model) {
//      model.addAttribute("request", request);
//      uploadService.loadUploadList(model);
//      return "upload/list";
//    }
    
//    @GetMapping("/userInfo")
//    public String getUserInfo(HttpServletRequest request, Model model) {
//        HttpSession session = request.getSession();
//        UserDto user = (UserDto) session.getAttribute("user");
//        
//        if (user != null) {
//            String empId = user.getEmpId();
//            UserDto userInfo = approvalService.getUserWithDep();
//            
//        }
    

    

    
    
}