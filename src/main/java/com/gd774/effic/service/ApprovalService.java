package com.gd774.effic.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ApprovalService {
	
	int registerApproval(MultipartHttpServletRequest multipartRequest);
	List<Map<String, Object>> getMyDocList();


		
		
}


