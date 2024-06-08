package com.gd774.effic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ReferenceDto {
	private int docId;
	private String refType, empId;
	private int deptId;
}
