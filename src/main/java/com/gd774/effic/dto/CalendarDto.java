package com.gd774.effic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class CalendarDto {
  private String empId, startDt, endDt, title, contents, startHour, endHour;
  private int scheduleId, docState, depId;
  // private DepDto dep;
  // private Posdep pos
  // private ResDto res;
}