package com.gd774.effic.service;

import com.gd774.effic.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;

/**
 * UserService
 */
public interface UserService {
	public boolean signin(HttpServletRequest request);

}
