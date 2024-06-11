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
public class RoomReserveDto {
  private int reserveId;
	private String reserveContents, updId;
	private Date updDt, availStartDt, availEndDt;
	private RoomManageDto roomId;
	private UserDto reserveUser;
}
