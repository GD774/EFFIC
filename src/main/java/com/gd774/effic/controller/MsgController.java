package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="msg")
@Controller
public class MsgController {
	
	@GetMapping(value="inboxList")
	public String goInboxList() {
		return "msg/inboxList";
	}
	
	
	
}
