package com.gd774.effic.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.MsgDto;

import jakarta.servlet.http.HttpServletRequest;


public interface MsgService {

	int msgInsert(MultipartHttpServletRequest multipartRequest);
	ResponseEntity<Map<String, Object>> getSentList(HttpServletRequest request);
	MsgDto getMsgDetail(int msgId);
	
}
