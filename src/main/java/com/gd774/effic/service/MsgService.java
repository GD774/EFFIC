package com.gd774.effic.service;

import java.util.List;
import java.util.Map;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.MsgAttachDto;
import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;


public interface MsgService {

	//메세지 작성
	int msgInsert(MultipartHttpServletRequest multipartRequest);
	int msgInsertMe(MultipartHttpServletRequest multipartRequest);
	
	//내게 쓴 메세지함
	ResponseEntity<Map<String, Object>> getToMeList(HttpServletRequest request);
	MsgDto getToMeDetail(int msgId);
	
	//보낸메세지함
	ResponseEntity<Map<String, Object>> getSentList(HttpServletRequest request);
	MsgDto getSentDetail(int msgId);
	List<String> getRecipientList(int msgId);
	
	//첨부파일
	List<MsgAttachDto> getAttachDetail(int msgId);
	ResponseEntity<Resource> download(HttpServletRequest request);
	ResponseEntity<Resource> downloadAll(int msgId);
	
	//받은메세지함
	ResponseEntity<Map<String, Object>> getInboxList(HttpServletRequest request);
	MsgDto getInboxDetail(int msgId, HttpServletRequest request);
	ResponseEntity<Map<String, Object>> getInboxTeamList(HttpServletRequest request);
	
	//중요메세지 체크
	int updateSentChkImpt(int msgId);
	int updateInboxChkImpt(int recpId);
	int updateSentOnlyChkImpt(int msgId);
	int updateInboxOnlyChkImpt(int recpId);
	//중요메세지 목록
	ResponseEntity<Map<String, Object>> getImpList(HttpServletRequest request);
	//전체선택으로 중요메세지 체크 해제
	int cancelSentChkImp(int msgId);
	int cancelInboxChkImp(int recpId);
	//중요메세지 R상세보기 작성
	int IsMsgId(int recpId);
	
	//휴지통이동
	int updateSentToBin(int msgId);
	int updateInboxToBin(int recpId);
	//휴지통 목록
	ResponseEntity<Map<String, Object>> getBinList(HttpServletRequest request);
	//휴지통에서 삭제(DELETE)
	 int updateMsgRemove(int msgid);
	 int updateRcpRemove(int recpId);
	//휴지통에서 꺼내기
	 int cancelInboxBin(int recpId);
	 int cancelSentBin(int msgId);
	 //휴지통 비우기
	 int clearBin();
	 
	 // 안읽은 메세지 세기
	 int getUnReadCount(String recipient);
	 
	 //팀메시지 등록
	 List<String> getTeamRegister(String depId, String empId);
	
	
	
}
