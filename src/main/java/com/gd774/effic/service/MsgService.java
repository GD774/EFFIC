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

	//메세지 작성
	int msgInsert(MultipartHttpServletRequest multipartRequest);
	
	//보낸메세지함
	ResponseEntity<Map<String, Object>> getSentList(HttpServletRequest request);
	MsgDto getSentDetail(int msgId);
	
	//첨부파일
	List<MsgAttachDto> getAttachDetail(int msgId);
	ResponseEntity<Resource> download(HttpServletRequest request);
	ResponseEntity<Resource> downloadAll(int msgId);
	
	//받은메세지함
	ResponseEntity<Map<String, Object>> getInboxList(HttpServletRequest request);
	MsgDto getInboxDetail(int msgId, HttpServletRequest request);
	
	//중요메세지 체크
	int updateSentChkImpt(int msgId);
	int updateInboxChkImpt(int recpId);
	int updateSentOnlyChkImpt(int msgId);
	//중요메세지 목록
	ResponseEntity<Map<String, Object>> getImpList(HttpServletRequest request);
	
	//휴지통이동
	int updateSentToBin(int msgId);
	int updateInboxToBin(int recpId);
	//휴지통 목록
	ResponseEntity<Map<String, Object>> getBinList(HttpServletRequest request);
	
	
	
}
