package com.gd774.effic.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class RoomManageDto {
  private int roomId, roomState, attendeeNo;
  private String roomName, mon, tue, wed, thu, fri, sat, sun;
  private Date startDt, endDt;
}
