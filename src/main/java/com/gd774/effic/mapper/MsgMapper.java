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
}
