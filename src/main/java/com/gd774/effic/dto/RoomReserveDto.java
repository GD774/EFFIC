package com.gd774.effic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class RoomReserveDto {
	private int reserveId;
	private String availStartDt, availEndDt;
	private String reserveContent, userId, updDt, updId;
	private int attendeeNo, roomId;
}
