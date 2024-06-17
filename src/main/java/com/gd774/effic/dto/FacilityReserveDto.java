package com.gd774.effic.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class FacilityReserveDto {
  private int rentId, rentState;
  private String updId, startDt, endDt, updDt;
  private int facilityId;
  private UserDto rentUser;
  private FacilityManageDto facility;
}
