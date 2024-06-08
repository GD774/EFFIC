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
	private int rentId;
	private String startDt, endDt, rentState;
	private String userId, updDt, updId;
	private int facilityId;
}
