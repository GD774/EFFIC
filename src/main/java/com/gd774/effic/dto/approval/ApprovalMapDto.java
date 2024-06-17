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

public class ApprovalMapDto {
	   private int docId;
	    private String empId;
	    private String title;
	    private String contents;
	    private int docTempCode;
	    private Date writeDt;
	    private Date updateDt;
	    private String depId;
	    private String docState;
	    private String urgent;
	    private String remarks;
	    private String other;
	    private String amount;
	    private List<DocItemDto> items;  // 추가된 필드
	    
	    private UserDto userDto;
	    private AppDocDto appDocDto;
	
	
}
