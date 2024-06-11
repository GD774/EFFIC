package com.gd774.effic.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.gd774.effic.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public interface AdminService {
	public int enroll(HttpServletRequest request);
	public ArrayList<UserDto> getUserList();
}
