package com.gd774.effic.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class FacilityManageDto {
  private int facilityId, rentTerm, facilityState;
  private String modelName, buyDt;
  private CategoryDto cat;
}
