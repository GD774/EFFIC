package com.gd774.effic.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class MsgDto {
    String empId, title, contents;
    Date sendDt;
    int msgId, state, isDelete,chkImpt;
}
