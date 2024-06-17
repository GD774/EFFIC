package com.gd774.effic.controller;

import java.util.List;
import java.util.Map;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd774.effic.dto.UserDto;
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
	

	@GetMapping(value="/tree.page")
	public String treePage() {
		return "msg/tree";
	}
	
	@GetMapping(value="/write.page")
	public String goWrite(@RequestParam(defaultValue = "") String sender, Model model, HttpServletRequest request) {
		model.addAttribute("sender", sender);
		UserDto user =  (UserDto) request.getSession().getAttribute("user");
		String empId = user.getEmpId();
		String depId= user.getDepId();
		System.out.println(depId);
		String teamList = String.join(",", msgService.getTeamRegister(depId, empId));
		
		model.addAttribute("teamList", teamList);
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
		
        UserDto user = (UserDto)multipartRequest.getSession().getAttribute("user");
        String sender = user.getEmpId();
		String recipient = multipartRequest.getParameter("recp");
		
		if (sender.equals(recipient)) {
			redirectAttributes.addFlashAttribute("inserted", msgService.msgInsertMe(multipartRequest));
		} else {
			redirectAttributes.addFlashAttribute("inserted", msgService.msgInsert(multipartRequest));
			redirectAttributes.addFlashAttribute("recipient", recipient);
		}
		
		
		return "redirect:sentList.page";
	}
	
	@PostMapping(value="/writeToMe.do")
	public String insertToMeMsg(MultipartHttpServletRequest multipartRequest, RedirectAttributes redirectAttributes) {
		
	   redirectAttributes.addFlashAttribute("inserted", msgService.msgInsertMe(multipartRequest));
		
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
        //수신자 목록
        
        // [] 가 없는게 더 보기 좋을 거 같아서 빼줬음.
        List<String> list = msgService.getRecipientList(msgId);
        String petitList = list.toString().replace("[", "").replace("]", "");
        model.addAttribute("recipientList", petitList);
        
		
		return "msg/sentDetail";
	}
	
	@GetMapping(value="/getToMeDetail.do")
	public String getToMeDetail(@RequestParam int msgId, Model model) {
        model.addAttribute("msg",msgService.getToMeDetail(msgId));
        model.addAttribute("attachList", msgService.getAttachDetail(msgId));
        
		
		return "msg/toMeDetail";
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

		
	@GetMapping(value="/getToMeList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getToMeList(HttpServletRequest request) {

		return msgService.getToMeList(request);
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
	
	// 단일 별
	@PostMapping(value="/updateSentChkImpt.do", produces="application/json")
	@ResponseBody
	public int updateSentChkImpt(@RequestParam int msgId){
		
		return msgService.updateSentChkImpt(msgId);
		
	}
	
	// 체크박스 별
	@PostMapping(value="/updatesSentChkImpt.do", produces="application/json")
	@ResponseBody
	public int updatesSentChkImpt(@RequestParam(value="checkValues[]") List<Integer> checkValues){
		 
		int updateCount = 0;
	
		for(int check : checkValues) {
			
			updateCount += msgService.updateSentOnlyChkImpt(check);
		}
		
		return updateCount;
		
	}
	
	

	@PostMapping(value="/updateInboxChkImpt.do", produces="application/json")
	@ResponseBody
	public int updateInboxChkImpt(@RequestParam int recpId){
		
		return msgService.updateInboxChkImpt(recpId);
		
	}
	
	// 체크박스 별
	@PostMapping(value="/updatesInboxChkImpt.do", produces="application/json")
	@ResponseBody
	public int updatesInboxChkImpt(@RequestParam(value="checkValues[]") List<Integer> checkValues){
		 
		int updateCount = 0;
	
		for(int check : checkValues) {
			
			updateCount += msgService.updateInboxOnlyChkImpt(check);
		}
		
		return updateCount;
		
	}
	
	@GetMapping(value="/getImpList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getImpList(HttpServletRequest request) {

		return msgService.getImpList(request);
	}
	
	@GetMapping(value="/getImpDetail.do")
	public String getImpDetail(@RequestParam String sort, HttpServletRequest request, Model model) {
       
		String msgSort = sort.substring(0, 1); 
		int pk = Integer.parseInt(sort.substring(1));
		
		
		if(msgSort.equals("M")) {
			model.addAttribute("msg", msgService.getSentDetail(pk));
	        model.addAttribute("attachList", msgService.getAttachDetail(pk));
	        List<String> list = msgService.getRecipientList(pk);
	        String petitList = list.toString().replace("[", "").replace("]", "");
	        model.addAttribute("recipientList", petitList);
	        return "msg/sentDetail";
		} else if (msgSort.equals("R")) {
			int rpk = msgService.IsMsgId(pk);
			model.addAttribute("rcp", msgService.getInboxDetail(rpk, request));
	        model.addAttribute("attachList", msgService.getAttachDetail(rpk));
	        return "msg/inboxDetail";
		} else if(msgSort.equals("P")) {
			model.addAttribute("msg", msgService.getToMeDetail(pk));
	        model.addAttribute("attachList", msgService.getAttachDetail(pk));
	        return "msg/toMeDetail";
		}

		return null;
	}

	
	
	@PostMapping(value="/updateImpChkImpt.do", produces="application/json")
	@ResponseBody
	public int updateImpChkImpt(@RequestParam String sort){
		String msgSort = sort.substring(0, 1); 
		System.out.println(msgSort);// 조아쓰 잘 나옴
		int pk = Integer.parseInt(sort.substring(1));
		System.out.println(pk);
		
		int updateCount = 0;
		
		if(msgSort.equals("M")) {
			updateCount = msgService.updateSentChkImpt(pk);
		} else if (msgSort.equals("R")) {
			updateCount = msgService.updateInboxChkImpt(pk);
		} else if(msgSort.equals("P")){
			updateCount = msgService.updateSentChkImpt(pk);
	    }

		return updateCount;
		
	}
	
	
	
	
	@PostMapping(value="/updateSentToBin.do", produces="application/json")
	@ResponseBody
	public int updateSentToBin(@RequestParam(value="checkValues[]") List<Integer> checkValues){
		 
		System.out.println("컨트롤러 돌고 있음");
		int updateCount = 0;
	
		for(int check : checkValues) {
			System.out.println(check);
			updateCount += msgService.updateSentToBin(check);
		}
		
		return updateCount;
		
	}
	
	@PostMapping(value="/updateInboxToBin.do", produces="application/json")
	@ResponseBody
	public int updateInobxToBin(@RequestParam(value="checkValues[]") List<Integer> checkValues){
		 
		System.out.println("컨트롤러 돌고 있음");
		int updateCount = 0;
	
		for(int check : checkValues) {
			System.out.println(check);
			updateCount += msgService.updateInboxToBin(check);
		}
		
		return updateCount;
	}

	

	@GetMapping(value="/getBinList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getBinList(HttpServletRequest request) {

		return msgService.getBinList(request);
	}
	
	@PostMapping(value="/cancelChkImpt.do", produces="application/json")
	@ResponseBody
	public int cancelImpChk(@RequestParam List<String> checkValues){
		
		int updateCount = 0;
	
		
		for(String check : checkValues) {
			
			String msgSort = check.substring(0, 1); 
			int pk = Integer.parseInt(check.substring(1));
			if(msgSort.equals("M")) {
				updateCount = msgService.cancelSentChkImp(pk);
			} else if (msgSort.equals("R")) {
				updateCount = msgService.cancelInboxChkImp(pk);
			} else if(msgSort.equals("P")) {
				updateCount = msgService.cancelSentChkImp(pk);
			}
		}
		
		return updateCount;
		
	}
	
	@PostMapping(value="/updateRemove.do", produces="application/json")
	@ResponseBody
	public int updateMsgRemove(@RequestParam List<String> checkValues){

		int updateCount = 0;
		
		for(String check : checkValues) {
			
			String msgSort = check.substring(0, 1); 
			int pk = Integer.parseInt(check.substring(1));
			if(msgSort.equals("M")) {
				updateCount =  msgService.updateMsgRemove(pk);
			} else if (msgSort.equals("R")) {
				updateCount = msgService.updateRcpRemove(pk);
			} else if(msgSort.equals("P")) {
				updateCount =  msgService.updateMsgRemove(pk);
			}
		}
		
		return updateCount;
		
	}
	
	@PostMapping(value="/cancelBin.do", produces="application/json")
	@ResponseBody
	public int cancelBin(@RequestParam List<String> checkValues){

		int updateCount = 0;
		
		for(String check : checkValues) {
			
			String msgSort = check.substring(0, 1); 
			int pk = Integer.parseInt(check.substring(1));
			if(msgSort.equals("M")) {
				updateCount =  msgService.cancelSentBin(pk);
			} else if (msgSort.equals("R")) {
				updateCount = msgService.cancelInboxBin(pk);
			} else if(msgSort.equals("P")) {
				updateCount =  msgService.cancelSentBin(pk);
			}
		}
		
		return updateCount;
		
	}
	
	@PostMapping(value="/clearBin.do", produces="application/json")
	@ResponseBody
	public int clearBin(){

		return msgService.clearBin();
		
	}
	
	
	//상세보기 화면에서의 보관
	@PostMapping(value="/sentDetailchkImp.do", produces="application/json")
	@ResponseBody
	public int sentDetailchkImp(int msgId){

		
		return msgService.updateSentOnlyChkImpt(msgId);
		
	}
	
	//상세보기 화면에서의 삭제
	@PostMapping(value="/inboxDetailchkImp.do", produces="application/json")
	@ResponseBody
	public int inboxDetailchkImp(int recpId){

		
		return msgService.updateInboxOnlyChkImpt(recpId);
		
	}
	
	@PostMapping(value="/sentDetailToBin.do", produces="application/json")
	@ResponseBody
	public int sentDetailToBin(int msgId){

		
		return msgService.updateSentToBin(msgId);
		
	}
	
	@PostMapping(value="/inboxDetailToBin.do", produces="application/json")
	@ResponseBody
	public int inboxDetailToBin(int recpId){

		
		return msgService.updateInboxToBin(recpId);
		
	}
	
	@PostMapping(value="/updateImpToBin.do", produces="application/json")
	@ResponseBody
	public int updateImpToBin(@RequestParam List<String> checkValues){
		
		int updateCount = 0;
	
		
		for(String check : checkValues) {
			
			String msgSort = check.substring(0, 1); 
			int pk = Integer.parseInt(check.substring(1));
			if(msgSort.equals("M")) {
				updateCount = msgService.updateSentToBin(pk);
			} else if (msgSort.equals("R")) {
				updateCount = msgService.updateInboxToBin(pk);
			} else if(msgSort.equals("P")) {
				updateCount = msgService.updateSentToBin(pk);
			}
		}
		
		return updateCount;
		
	}
	
	@GetMapping(value="/getTeamList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getTeamList(HttpServletRequest request) {

		return msgService.getInboxTeamList(request);
	}
	

	

	
	
	
}
