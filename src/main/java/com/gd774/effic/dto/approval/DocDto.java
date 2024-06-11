package com.gd774.effic.dto.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

public class DocDto {
	private String itemName, itemStandard, remarks;
	private int itemQuan, itemCost, amount, docId;
}
