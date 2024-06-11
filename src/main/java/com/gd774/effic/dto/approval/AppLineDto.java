package com.gd774.effic.dto.approval;

import java.sql.Date;

import com.gd774.effic.dto.UserDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder

public class AppLineDto {
	private int lineId;
	private String lineType, lineFavOrder, register, updater;
	private Date registDt, updateDt;
	private UserDto user;
}
