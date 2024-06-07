package com.gd774.effic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.MsgAttachDto;
import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.RecpDto;

@Mapper
public interface MsgMapper {
	
	//메세지 작성
	 int insertMsg(MsgDto msg);
	 int insertRecp(RecpDto recp);
	 
	 //보낸 메세지함
	 List<MsgDto> getListMsg(Map<String, Object>map);
	 int getMsgCount(String sender);
	 MsgDto getMsgDetail(int msgId);
	 MsgDto recipientList(int msgId); 
	 
	 //첨부파일
	 int insertAttach(MsgAttachDto msgAttach);
	 List<MsgAttachDto> getMsgAttach(int msgId);
	 MsgAttachDto getMsgOneAttach(int msgId);
	 int selectCountAttach(int msgId);
	 
	 //받은 메세지함
	 List<MsgDto> getListRcp(Map<String, Object>map);
	 int getRcpCount(String recipient);
	 MsgDto getRcpDetail(Map<String, Object> map);
	 int updateReadDt(Map<String, Object> map);
	 
	 //중요 메세지 체크
	 int updateSentChkImpt(int msgId);
	 int updateInboxChkImpt(int recpId);
	 int updateSentOnlyChkImpt(int msgId);
     
	 //중요 메세지 리스트
     int getImpCount(Map<String, Object> map);
	 List<MsgDto> getImpList(Map<String, Object> map);
	 
	 //휴지통 이동
	 int updateSentTobBin(int msgId);
	 int updateInboxToBin(int recpId);
	 
	 //휴지통 메세지 리스트
	 int getBinCount(Map<String, Object> map);
	 List<MsgDto> getBinList(Map<String, Object> map);
	 
	 
	 

}
