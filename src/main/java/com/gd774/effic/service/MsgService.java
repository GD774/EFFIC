package com.gd774.effic.service;

import java.util.List;
import java.util.Map;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.MsgAttachDto;
import com.gd774.effic.dto.MsgDto;

import jakarta.servlet.http.HttpServletRequest;


public interface MsgService {

	int msgInsert(MultipartHttpServletRequest multipartRequest);
	ResponseEntity<Map<String, Object>> getSentList(HttpServletRequest request);
	MsgDto getMsgDetail(int msgId);
	List<MsgAttachDto> getAttachDetail(int msgId);
	ResponseEntity<Resource> download(HttpServletRequest request);
	ResponseEntity<Resource> downloadAll(int msgId);
	
}
