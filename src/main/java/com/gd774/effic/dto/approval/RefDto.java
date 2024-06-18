package com.gd774.effic.dto.approval;

import com.gd774.effic.dto.UserDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

public class RefDto {
	private String refType, empId, depId;
	private int docId;
	private UserDto user;
	private AppDocDto appDoc;

	
	
	
}
