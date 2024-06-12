package com.gd774.effic.service;

import java.nio.file.Files;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.mapper.ApprovalMapper;
import com.gd774.effic.mapper.MsgMapper;
import com.gd774.effic.util.MsgPaging;
import com.gd774.effic.util.PageUtils;

import net.coobird.thumbnailator.Thumbnails;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	  private final ApprovalMapper approvalMapper;
	  private final  PageUtils PageUtils;
	  
	  public ApprovalServiceImpl(ApprovalMapper approvalMapper, PageUtils pageUtils) {
		  super();
		  this.approvalMapper = approvalMapper;
		  this.PageUtils = pageUtils;
	  }
			
	// 기안 등록
	@Override
	public int RegisterApproval(MultipartHttpServletRequest multipartRequest) {
		String title = multipartRequest.getParameter("title");
		String contents = multipartRequest.getParameter("contents");
		UserDto user = (UserDto)multipartRequest.getSession().getAttribute("user");
		String empId = user.getEmpId();
		
		
		AppDocDto approval = AppDocDto.builder()
				.title(title)
				.contents(contents)
				.user(user)
				.build();
		
		return 0;
	}
	
	
	
}
