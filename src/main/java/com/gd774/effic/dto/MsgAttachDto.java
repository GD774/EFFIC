package com.gd774.effic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class MsgAttachDto {
	String uploadPath, filesysName, originalName;
	int attachId, msgId;
}
