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
  private int rentId, rentTerm;
  private String startDt, endDt, rentUser;
  private int facilityId;
  private UserDto user;
  private FacilityManageDto facility;
}
