package com.gd774.effic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class MsgDto {
    String sender, title, contents, sendDt;
    String sort, recipient, originalName, readDt;
    int msgId, state, isDelete, chkImpt, recpId;
}
