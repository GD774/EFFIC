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

public class ApprovalDto {
	private int appId, docId;
	private String drafter, approver, appState, appDocId, reject;
	private Date sumbitDt, appDt;
	private AppDocDto appDocDto;
	private UserDto userDto;
}
