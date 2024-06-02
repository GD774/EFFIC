package com.gd774.effic.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.RecpDto;

@Mapper
public interface MsgMapper {
	public int insertMsg(MsgDto msg);
	public int insertRecp(RecpDto recp);
}
