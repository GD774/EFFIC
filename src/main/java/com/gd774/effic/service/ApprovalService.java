package com.gd774.effic.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.DocItemDto;

import jakarta.servlet.http.HttpServletRequest;

public interface ApprovalService {
	
	int registerApproval(MultipartHttpServletRequest multipartRequest);	
	void loadMyDocList(HttpServletRequest request, Model model);
	void loadMyTemporaryList(HttpServletRequest request, Model model);
	void loadDepDocList(HttpServletRequest request, Model model);
	AppDocDto loadAppDocById(int docId);
	void detailDocByDocId(HttpServletRequest request, Model model);
	
	
	



		
		
}


