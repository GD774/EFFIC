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

public class ReferenceDto {
	private String refType;
	private AppDocDto doc;
	private UserDto user;
//	private DepDto dep;
	
}
