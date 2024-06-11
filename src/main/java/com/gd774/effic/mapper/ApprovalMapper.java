package com.gd774.effic.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.approval.AppAttachDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.DocDto;

@Mapper
public interface ApprovalMapper {
	
	int registerApproval(AppDocDto approval);
	int insertAttach(AppAttachDto approval);
	int insertDoc(DocDto approval);


}
