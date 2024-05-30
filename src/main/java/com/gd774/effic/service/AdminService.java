package com.gd774.effic.service;

import java.util.ArrayList;

import com.gd774.effic.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;

public interface AdminService {
	public int enroll(HttpServletRequest request);
	public ArrayList<UserDto> getUserList();
}
