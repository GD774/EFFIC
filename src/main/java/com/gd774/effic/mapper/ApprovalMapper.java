package com.gd774.effic.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.approval.AppDocDto;

@Mapper
public interface ApprovalMapper {
	
	int registerApproval(AppDocDto approval);


}
