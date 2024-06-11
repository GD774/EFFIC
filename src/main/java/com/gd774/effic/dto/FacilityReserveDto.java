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
public class FacilityReserveDto {
  private int rentId;
  private Date startDt, endDt, updDt;
  private String updId;
  private int facilityId;
  private UserDto rentUser;
}
