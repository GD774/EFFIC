package com.gd774.effic.dto.approval;

import java.sql.Date;
import java.util.List;

import com.gd774.effic.dto.UserDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

public class AppDocDto {
	private String title, contents, docState, urgent, empId, depId;
	private int docId, docTempCode;
	private Date writeDt, updateDt;
	private UserDto user;
    private DocDto docDetails; // DocDto 객체 참조
    private List<DocItemDto> docItems; // DocItemDto 리스트 참조
	
	
	
}
