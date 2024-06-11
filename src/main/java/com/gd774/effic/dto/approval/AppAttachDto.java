package com.gd774.effic.dto.approval;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

public class AppAttachDto {
	private int attachNo, docId;
	private String attachId, filesystemName, originalfilename, uploadPath;
	
	
}
