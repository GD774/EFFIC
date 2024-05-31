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
  private String userId, startDt, endDt, title, contents;
  private int scheduleId, docState;
  // private DepDto dep;
  // private Posdep pos
  // private ResDto res;
}