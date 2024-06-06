package com.gd774.effic.controller;

import java.util.Map;
import java.util.Optional;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd774.effic.mapper.MsgMapper;
import com.gd774.effic.service.MsgService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RequestMapping(value="/msg")
@RequiredArgsConstructor
@Controller
public class MsgController {
	
	private final MsgService msgService;
	private final MsgMapper msgMapper;
	
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
	public String insertMsg(MultipartHttpServletRequest multipartRequest, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("inserted", msgService.msgInsert(multipartRequest));
		
		return "redirect:sentList.page";
	}
	
	@GetMapping(value="/getSentList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getSentList(HttpServletRequest request) {

		return msgService.getSentList(request);
	}
	
	@GetMapping(value="/getSentDetail.do")
	public String getSentDetail(@RequestParam int msgId, Model model) {
        model.addAttribute("msg", msgService.getSentDetail(msgId));
        model.addAttribute("attachList", msgService.getAttachDetail(msgId));
        
		
		return "msg/sentDetail";
	}
	
	@GetMapping(value="/download.do")
	 public ResponseEntity<Resource> download(@RequestParam int msgId, HttpServletRequest request) {
		
	    int count = msgMapper.selectCountAttach(msgId);
	    
	    if(count >= 2) {
	    	return msgService.downloadAll(msgId);
	    } else {
	    	return msgService.download(request);
	    }
	
	   }
	
	@GetMapping(value="/getInboxList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getInboxList(HttpServletRequest request) {

		return msgService.getInboxList(request);
	}
	
	@GetMapping(value="/getInboxDetail.do")
	public String getInboxDetail(@RequestParam int msgId, Model model, HttpServletRequest request) {
        model.addAttribute("rcp", msgService.getInboxDetail(msgId, request));
        model.addAttribute("attachList", msgService.getAttachDetail(msgId));
        
        return "msg/inboxDetail";
	}
	
	@PostMapping(value="/updateSentChkImpt.do", produces="application/json")
	@ResponseBody
	public int updateSentChkImpt(@RequestParam int msgId){
		
		return msgService.updateSentChkImpt(msgId);
		
	}
	

	@PostMapping(value="/updateInboxChkImpt.do", produces="application/json")
	@ResponseBody
	public int updateInboxChkImpt(@RequestParam int recpId){
		
		return msgService.updateInboxChkImpt(recpId);
		
	}
	
	@GetMapping(value="/getImpList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getImpList(HttpServletRequest request) {

		return msgService.getImpList(request);
	}
	
	
	
	
}
