package com.gd774.effic.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.DocDto;

import jakarta.servlet.http.HttpServletRequest;

public interface ApprovalService {
	
	int registerApproval(MultipartHttpServletRequest multipartRequest);


		
		
}


