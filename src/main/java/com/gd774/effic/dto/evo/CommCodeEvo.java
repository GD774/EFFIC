package com.gd774.effic.dto.evo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class CommCodeEvo {
	private String code, name, catCode, catName;
}
