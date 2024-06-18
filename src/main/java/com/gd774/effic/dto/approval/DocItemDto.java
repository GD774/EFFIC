package com.gd774.effic.dto.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

public class DocItemDto {
	private String itemName, itemStandard, itemQuan, itemCost, amount;
	private int itemId, docId;
	private AppDocDto appDocDto;
	

}
