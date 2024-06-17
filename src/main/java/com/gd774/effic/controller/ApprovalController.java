package com.gd774.effic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.ApprovalMapDto;
import com.gd774.effic.dto.approval.DocItemDto;
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
    
//    // 전자결재 메인페이지
//    @GetMapping("/main")
//    public String approvalMain() {
//        return "approval/main";
//    }
    
    @GetMapping("/main")
    public String approvalMain(HttpServletRequest request, Model model) {
    	approvalService.loadMyDocList(request, model);
    	model.addAttribute("mainDocList", request);
    	return "approval/main";
    }
    
   
    @GetMapping("/myDocList")
    public String loadMyDocList(HttpServletRequest request, Model model) {
    	approvalService.loadMyDocList(request, model);
    	model.addAttribute("myDocList", request);
    	return "approval/myDocList";
    }
    
    
    @GetMapping("/myTemporaryList")
    public String loadMyTemporaryList(HttpServletRequest request, Model model) {
    	model.addAttribute("request", request);
    	approvalService.loadMyTemporaryList(request, model);
    	return "approval/myTemporaryList";
    }
    
    @GetMapping("depDocList")
    public String loadDepDocList(HttpServletRequest request, Model model) {
    	model.addAttribute("request", request);
    	approvalService.loadDepDocList(request, model);
    	return "approval/depDocList";
    }
    
	@GetMapping("/detail.do")
	  public String detail(@RequestParam int docId, Model model) {
        ApprovalMapDto approvalMapDto = approvalService.docById(docId);
        List<DocItemDto> docItemDto = approvalService.docItemsByDocId(docId);
        model.addAttribute("approvalMapDto", approvalMapDto);
        model.addAttribute("docItemDto", docItemDto);
	    return "approval/docDetail";
	  }
	
    
    @GetMapping("jstree")
    public String jstree(HttpServletRequest request, Model model) {

    	return "approval/jstree";
    }
    
    
    
    
//    // 전자결재 개인진행문서함
//    @GetMapping("/myIngDocList")
//    public String loadMyIngDocList(HttpServletRequest request, Model model) {
//    	model.addAttribute("request", request);
//    	approvalService.loadMyDocList(request, model);
//    }
    
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