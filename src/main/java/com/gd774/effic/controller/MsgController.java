package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/msg")
@Controller
public class MsgController {
	
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
	
	
	
}
