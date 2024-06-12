package com.gd774.effic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ScheduleDto {
	private int scheduleId;
	private String userId, startDt, endDt, startHour, endHour;
	private String title, contents;
	private int docState;
}
