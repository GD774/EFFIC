package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd774.effic.service.ApprovalService;

import lombok.RequiredArgsConstructor;

@RequestMapping(value="/approval")
@RequiredArgsConstructor
@Controller
public class ApprovalController {

	private ApprovalService approvalService;
	
	// 전자결재 메인페이지
	@GetMapping("/main")
	public String approvalMain() {
		return "approval/main";
	}
	
	// 전자결재 개인기안문서함
	@GetMapping(value="/myDocList.page")
	public String goMyDocList() {
		return "approval/myDocList";
	}
	
	// 전자결재 개인임시저장함
	@GetMapping(value="/temporaryList.page")
	public String goTemporaryList() {
		return "approval/temporaryList";
	}
	
	// 전자결재 개인참조문서함
	@GetMapping(value="/myRefList.page")
	public String goMyRefList() {
		return "approval/myRefList";
	}
	
	// 전자결재 개인결재문서함
	@GetMapping(value="/myAppDocList.page")
	public String goMyAppDocList() {
		return "approval/myAppDocList";
	}
	
	// 전자결재 부서기안완료함
	@GetMapping(value="/depDocList.page")
	public String goDepDocList() {
		return "approval/depDocList";
	}
	
	// 전자결재 부서참조문서함
	@GetMapping(value="/depRefList.page")
	public String goDepRefList() {
		return "approval/depRefList";
	}
	
	// 
	@GetMapping(value="/docTemp1.page")
	public String goWrite() {
		return "approval/docTemp1";
	}


						
	
	
	
}
