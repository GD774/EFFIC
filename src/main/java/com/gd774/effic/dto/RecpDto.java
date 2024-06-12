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
public class RecpDto {
    String recipient;
    String readDt;
    int recpId, msgId, state, chkImpt, isDelete;
}
