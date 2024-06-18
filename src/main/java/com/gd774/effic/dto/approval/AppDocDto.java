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
    private int docId;
    private String empId;
    private String title;
    private int docTempCode;
    private Date writeDt;
    private Date updateDt;
    private String depId;
    private String docState;
    private String urgent;

    // APPROVAL_T 테이블 칼럼
    private int appId;
    private String appState;
    private String drafter;
    private String approver;
    private Date submitDt;
    private Date appDt;
    private String appDocId;
    private String reject;

    // APP_LINE_T 테이블 칼럼
    private int lineId;
    private String lineType;
    private String lineFavOrder;
    private String register;
    private Date registerDt;
    private String updater;
    private Date updateDtLine;

    // DOC_TEMP_T 테이블 칼럼
    private String docTempName;
    private String contents;

    // APP_ATTACH_T 테이블 칼럼
    private int attachNo;
    private String attachId;
    private String originalFilename;
    private String filesystemName;
    private String uploadPath;

    // REFERENCE_T 테이블 칼럼
    private String refType;

    // DOC_T 테이블 칼럼
    private int docsId;
    private String remarks;
    private String other;

    // DOC_ITEM_T 테이블 칼럼
    private int itemId;
    private String itemName;
    private String itemStandard;
    private String itemQuan;
    private String itemCost;
    private String amount;
	private UserDto user;
	private ApprovalDto approval;
    private DocDto docDetails; // DocDto 객체 참조
    private List<DocItemDto> docItems; // DocItemDto 리스트 참조
	
	
	
}
