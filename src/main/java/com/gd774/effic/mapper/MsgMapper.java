package com.gd774.effic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.MsgAttachDto;
import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.RecpDto;

@Mapper
public interface MsgMapper {
	 int insertMsg(MsgDto msg);
	 int insertRecp(RecpDto recp);
	 List<MsgDto> getListMsg(Map<String, Object>map);
	 int getMsgCount();
	 MsgDto getMsgDetail(int msgId);
	 int insertAttach(MsgAttachDto msgAttach);
	 List<MsgAttachDto> getMsgAttach(int msgId);
}
