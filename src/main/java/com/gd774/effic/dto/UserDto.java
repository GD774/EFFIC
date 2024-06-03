package com.gd774.effic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UserDto {
	private String empId, pw, name, email, phone;
	private int permCode;
	// private DepDto dep;
	// private Posdep pos
	// private ResDto res;
}
