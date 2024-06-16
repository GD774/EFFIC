package com.gd774.effic.dto.evo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class DeptEvo {
	private String code, name;
	private int level;
	private DeptEvo parent;
}
