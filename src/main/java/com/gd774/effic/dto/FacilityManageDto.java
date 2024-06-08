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
	private int facilityIndex;
	private String modelName, buyDt, userId, rentType, facilityId;
	private int catIndex, facilityState;
}
