package com.gd774.effic.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface MsgService {

	int msgInsert(MultipartHttpServletRequest multipartRequest);
	
}
