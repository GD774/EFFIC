package com.gd774.effic.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.RecpDto;
import com.gd774.effic.dto.UserDto;
import com.gd774.effic.mapper.MsgMapper;

@Transactional
@Service
public class MsgServiceImpl implements MsgService {
 
	private final MsgMapper msgMapper;
	
	
	
	public MsgServiceImpl(MsgMapper msgMapper) {
		super();
		this.msgMapper = msgMapper;
	}



	@Override
	public int msgInsert(MultipartHttpServletRequest multipartRequest) {
		
		//MSG에 가장 먼저 삽입
		String title = multipartRequest.getParameter("title");
		System.out.println(title);
		String contents = multipartRequest.getParameter("contents");
		
		UserDto user = (UserDto)multipartRequest.getSession().getAttribute("user");
		
		System.out.println(multipartRequest.getSession().getAttribute("user"));
		
		String empId = user.getEmpId();
		
		MsgDto msg = MsgDto.builder()
				       .title(title)
				       .contents(contents)
				       .empId(empId)
				       .build();
		
		int insertMsgCount = msgMapper.insertMsg(msg);
		
		//RECP에 삽입
		String recipient =multipartRequest.getParameter("recp");
		
		RecpDto recp = RecpDto.builder()
	    		          .msgId(msg.getMsgId())
				          .empId(recipient)
				          .build();
		
		int inserRecpCount = msgMapper.insertRecp(recp);
		
		
		return 1;
	}

}






