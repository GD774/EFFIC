package com.gd774.effic.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.ApprovalDto;
import com.gd774.effic.dto.approval.DocDto;
import com.gd774.effic.dto.approval.DocItemDto;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

public interface ApprovalService {
	
	int registerApproval(MultipartHttpServletRequest multipartRequest);	
	List<AppDocDto> myDocListUserMain(HttpServletRequest request, Model model);
	void loadMyDocList(HttpServletRequest request, Model model);
	void loadMySaveDocList(HttpServletRequest request, Model model);
	void loadMyAppDocList(HttpServletRequest request, Model model); 
	void loadDepDocList(HttpServletRequest request, Model model);
	void detailDocByDocId(HttpServletRequest request, Model model);
	void modifyDoc(AppDocDto appDocDto, DocDto docDto, DocItemDto docItemDto, ApprovalDto approvalDto);
	AppDocDto getDocById(int docId);
	
	



		
		
}


