package com.gd774.effic.service;

import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.RecpDto;
import com.gd774.effic.dto.UserDto;
import com.gd774.effic.mapper.MsgMapper;
import com.gd774.effic.util.MsgPaging;

import jakarta.servlet.http.HttpServletRequest;

@Transactional
@Service
public class MsgServiceImpl implements MsgService {
 
	private final MsgMapper msgMapper;
	private final MsgPaging msgPaging;
	
	public MsgServiceImpl(MsgMapper msgMapper, MsgPaging msgPaging) {
		super();
		this.msgMapper = msgMapper;
        this.msgPaging = msgPaging;
	}
		
	




	@Override
	public int msgInsert(MultipartHttpServletRequest multipartRequest) {
		
		//MSG에 가장 먼저 삽입
		String title = multipartRequest.getParameter("title");
		System.out.println(title);
		String contents = multipartRequest.getParameter("contents");
		
		UserDto user = (UserDto)multipartRequest.getSession().getAttribute("user");
		
		System.out.println(multipartRequest.getSession().getAttribute("user"));
		
		String sender = user.getEmpId();
		
		MsgDto msg = MsgDto.builder()
				       .title(title)
				       .contents(contents)
				       .sender(sender)
				       .build();
		
		int insertMsgCount = msgMapper.insertMsg(msg);
		
		//RECP에 삽입
		String recipient = multipartRequest.getParameter("recp");
		
		RecpDto recp = RecpDto.builder()
	    		          .msgId(msg.getMsgId())
				          .recipient(recipient)
				          .build();
		
		int inserRecpCount = msgMapper.insertRecp(recp);
		
		// 이거 나중에 수정. boolean으로 바꿔서 1&&list=recp 로 해야할까?
		return 1;
	}
	
	@Override
	public ResponseEntity<Map<String, Object>> getSentList(HttpServletRequest request) {
		// 페이징 처리.
	    int total = msgMapper.getMsgCount();
	    int display = 10;		 // 화면 봐가면서 몇개가 적당할지 찾기. 15 아님 20 아님 25
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    msgPaging.setPaging(total, display, page);
	    
		
		// 페이징처리 안하고 우선 ajax 작동하는지 부터 확인함
		UserDto user = (UserDto)request.getSession().getAttribute("user");
		String sender = user.getEmpId();
		Map<String, Object> map = Map.of("sender", sender,"begin", msgPaging.getBegin() 
                , "end", msgPaging.getEnd());
		
		System.out.println(msgPaging.getBegin());
		System.out.println(msgPaging.getEnd());
		
		return new ResponseEntity<>(Map.of("msgList", msgMapper.getListMsg(map), "total", total
                , "paging", msgPaging.getAsyncPaging()), HttpStatus.OK);
	}
    
	 @Override
	public MsgDto getMsgDetail(int msgId) {
 
		 return msgMapper.getMsgDetail(msgId);
	}
}























