package com.gd774.effic.service;

import java.util.ArrayList;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.mapper.AdminMapper;
import com.gd774.effic.util.BasicSecurity;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class AdminServiceImpl implements AdminService {

	private final AdminMapper adminMapper;

	public AdminServiceImpl(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}

	public int enroll(HttpServletRequest request) {
		String eid = request.getParameter("eid");
		String pw = BasicSecurity.getHash(request.getParameter("pw"), BasicSecurity.SHA256);
		// String name = request.getParameter("name");
		// String email = request.getParameter("email");
		// String phone = request.getParameter("phone");

		UserDto user = UserDto.builder()
			.eid(eid)
			.pw(pw)
			// .name(name)
			// .email(email)
			// .phone(phone)
			.build();
		return adminMapper.insertUser(user);
	}

	public ArrayList<UserDto> getUserList() {
		return adminMapper.getUserList();
	}
}
