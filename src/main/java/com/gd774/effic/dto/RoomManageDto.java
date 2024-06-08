package com.gd774.effic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class RoomManageDto {
	private int roomId;
	private String startTime, endTime, roomName;
	private int roomState, attendeeNo;
}
