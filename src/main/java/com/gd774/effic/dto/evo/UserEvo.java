package com.gd774.effic.dto.evo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UserEvo {
	private String empId, pw, name;
	private int status, genderId;
	private Date joinDt, leaveDt;
	private DeptEvo dept;
	private CommCodeEvo pos;
}
