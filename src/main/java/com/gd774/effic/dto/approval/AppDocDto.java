package com.gd774.effic.dto.approval;

import java.sql.Date;

import com.gd774.effic.dto.UserDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

public class AppDocDto {
	private String title, contents, docState, urgent, empId;
	private int docId, depId, docTempCode;
	private Date writeDt, updateDt;
	private UserDto user;
//	private DepDto dep;
	
	
}
