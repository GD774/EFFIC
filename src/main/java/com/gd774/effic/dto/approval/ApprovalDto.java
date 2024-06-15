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

public class ApprovalDto {
	private int appId;
	private String appState, appDocId, reject, lineOrder;
	private Date sumbitDt, appDt;
	private AppDocDto doc;
}
