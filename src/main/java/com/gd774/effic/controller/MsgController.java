package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd774.effic.service.MsgService;

import lombok.RequiredArgsConstructor;

@RequestMapping(value="/msg")
@RequiredArgsConstructor
@Controller
public class MsgController {
	
	private final MsgService msgService;
	
	@GetMapping(value="/write.page")
	public String goWrite() {
		return "msg/write";
	}
	
	@GetMapping(value="/toMe.page")
	public String goToMe() {
		return "msg/toMe";
	}
	
	@GetMapping(value="/inboxList.page")
	public String goInboxList() {
		return "msg/inboxList";
	}
	
	@GetMapping(value="/sentList.page")
	public String goSentList() {
		return "msg/sentList";
	}
	
	@GetMapping(value="/impList.page")
	public String goImpList() {
		return "msg/impList";
	}
	
	@GetMapping(value="/bin.page")
	public String goBin() {
		return "msg/bin";
	}
	
	@PostMapping(value="/write.do")
	public String insertMessage(MultipartHttpServletRequest multipartRequest, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("inserted", msgService.msgInsert(multipartRequest));
		
		return "msg/sentList";
	}
	
	
}
