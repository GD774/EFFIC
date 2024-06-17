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
    String sort, recipient, originalName, readDt, name, rname, sname, depId;
    int msgId, state, isDelete, isMe, chkImpt, recpId;
    boolean hasAttach;
}
