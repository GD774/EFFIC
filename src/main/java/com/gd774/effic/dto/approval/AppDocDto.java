package com.gd774.effic.dto.approval;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

public class AppDocDto {
	private String title, contents, docState, urgent;
	private int docId;
	private Date writeDt, updateDt;
	
}
