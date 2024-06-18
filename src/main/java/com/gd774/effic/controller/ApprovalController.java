package com.gd774.effic.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.ApprovalDto;
import com.gd774.effic.dto.approval.DocDto;
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
    
    
    @GetMapping("/main")
    public String approvalMain(HttpServletRequest request, Model model) {
    	approvalService.loadMyDocList(request, model);
    	approvalService.loadMyAppDocList(request, model);
    	
    	model.addAttribute("myDocList", request);
    	model.addAttribute("myAppDocList", request);
    	return "approval/main";
    }
    
   
    @GetMapping("/myDocList")
    public String loadMyDocList(HttpServletRequest request, Model model) {
    	model.addAttribute("myDocList", request);
    	approvalService.loadMyDocList(request, model);
    	return "approval/myDocList";
    }
    
    
    @GetMapping("/mySaveDocList")
    public String loadMySaveDocList(HttpServletRequest request, Model model) {
    	approvalService.loadMySaveDocList(request, model);
    	model.addAttribute("mySaveDocList", request);
    	return "approval/mySaveDocList";
    }
    
    @GetMapping("/myAppDocList")
    public String loadMyAppDocList(HttpServletRequest request, Model model) {
    	approvalService.loadMyAppDocList(request, model);
    	model.addAttribute("myAppDocList", request);
    	return "approval/myAppDocList";
    }
    
    @GetMapping("/depDocList")
    public String loadDepDocList(HttpServletRequest request, Model model) {
    	model.addAttribute("request", request);
    	approvalService.loadDepDocList(request, model);
    	return "approval/depDocList";
    }
    
	@GetMapping("/detail.do")
	  public String detailDoc(HttpServletRequest request, Model model) {
		approvalService.detailDocByDocId(request, model);
	    return "approval/docDetailApprover";
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
    
    
    @PostMapping("/edit.do")
    public String edit(@RequestParam int docId, Model model) {
      model.addAttribute("docId", approvalService.getDocById(docId));
      return "approval/edit";
    }
    
    @PostMapping("/update.do")
    public String updateDoc(
            @ModelAttribute AppDocDto appDocDto,
            @ModelAttribute DocDto docDto,
            @ModelAttribute DocItemDto docItemDto,
            @ModelAttribute ApprovalDto approvalDto,
            RedirectAttributes redirectAttributes) {

        try {
            approvalService.modifyDoc(appDocDto, docDto, docItemDto, approvalDto);
            redirectAttributes.addAttribute("docId", appDocDto.getDocId())
                              .addFlashAttribute("modifyResult", "수정되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addAttribute("docId", appDocDto.getDocId())
                              .addFlashAttribute("modifyResult", "수정을 하지 못했습니다. 오류: " + e.getMessage());
        }

        return "redirect:/approval/detail.do?docId={docId}";
    }
    

}
    

    

    
    
