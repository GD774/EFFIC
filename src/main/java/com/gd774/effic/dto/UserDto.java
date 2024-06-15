package com.gd774.effic.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UserDto {

	private String empId, pw, name, depId, posId;
	private int status, genderId;
	private Date joinDt, leaveDt;
	private DepDto dep;
}
