package com.gd774.effic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.MsgAttachDto;
import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.RecpDto;
import com.gd774.effic.dto.UserDto;

@Mapper
public interface MsgMapper {
	
	 //메세지 작성
	 int insertMsg(MsgDto msg);
	 int insertRecp(RecpDto recp);
	 //나에게 작성
	 int insertMe(MsgDto msg);
	
	 // 나에게 쓴 메세지함
	 int getToMeCount(String empId);
	 List<MsgDto> getToMeList(Map<String, Object>map);
	 MsgDto getToMeDetail(int msgId);
	 
	 //보낸 메세지함
	 List<MsgDto> getListMsg(Map<String, Object>map);
	 int getMsgCount(String sender);
	 MsgDto getMsgDetail(int msgId);
	 MsgDto recipientList(int msgId);
	 List<String> getRecipientList(int msgId); //수신자목록을 가져오는 맵퍼 
	 
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
	 int countNoRead(String recipient);
	 
	 
	 //중요 메세지 체크
	 int updateSentChkImpt(int msgId);
	 int updateInboxChkImpt(int recpId);
	 int updateSentOnlyChkImpt(int msgId);
	 int updateInboxOnlyChkImpt(int recpId);
	 //중요 메세지 리스트
     int getImpCount(Map<String, Object> map);
	 List<MsgDto> getImpList(Map<String, Object> map);
	 // 전체선택으로 중요메세지리스트에서 해제
	 int cancelInboxImpList(int recpId);
	 int cancelSentImpList(int msgId);
	 //중요메세지 R상세보기 위해 작성
	 int IsMsgId(int recpId);
	 
	 //휴지통 이동
	 int updateSentTobBin(int msgId);
	 int updateInboxToBin(int recpId);
	 //휴지통 메세지 리스트
	 int getBinCount(Map<String, Object> map);
	 List<MsgDto> getBinList(Map<String, Object> map);
	 //휴지통에서 삭제
	 int updateMsgRemove(int msgid);
	 int updateRcpRemove(int recpId);
	 //휴지통에서 꺼내기
	 int cancelInboxBin(int recpId);
	 int cancelSentBin(int msgId);
	 // 휴지통 비우기 
	 int allRemoveMsg();
	 int allRemoveRecp();
	 
	 //팀메세지
	 List<String> getTeamRegister(String depId, String empId);
	 int getTeamInboxCount(Map<String, Object> map);
	 List<MsgDto> getTeamInboxList(Map<String, Object> map);
	 
	 //EMP_ID 별로 읽지 않은메세지 개수 뽑기
	 int getUnReadCount(String recipient);
	 

}
