package com.gd774.effic.service;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.mapper.UserMapper;
import com.gd774.effic.util.BasicSecurity;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService {

	private final UserMapper userMapper;

	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public boolean signin(HttpServletRequest request) {
		String empId = request.getParameter("empId");
		String pw = BasicSecurity.getHash(request.getParameter("pw"), BasicSecurity.SHA256);

		UserDto user = userMapper.getUserByIdAndPw(empId, pw);

		if (user != null)
			try {
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		return false;
	}
	
}
