package com.gd774.effic.service;

import java.util.ArrayList;
import java.util.Optional;

import com.gd774.effic.dto.evo.CommCodeEvo;
import com.gd774.effic.dto.evo.DeptEvo;
import com.gd774.effic.dto.evo.UserEvo;
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

	@Override
	public ArrayList<UserEvo> getUsers() {
		return adminMapper.selectUsers();
	}

	@Override
	public ArrayList<DeptEvo> getDepts() {
		return adminMapper.selectDepts();
	}

	@Override
	public ArrayList<CommCodeEvo> getPositions() {
		return adminMapper.selectCommCodes("P");
	}

	@Override
	public int addUser(HttpServletRequest request) {
		String empId = request.getParameter("empId");
		String pw = BasicSecurity.getHash(request.getParameter("pw"), BasicSecurity.SHA256);
		String name = request.getParameter("name");

		UserEvo user = UserEvo.builder()
			.empId(empId)
			.pw(pw)
			.name(name)
			.build();
		return adminMapper.insertUser(user);
	}

	@Override
	public int delUser(HttpServletRequest request) {
		String empId = request.getParameter("empId");
		return adminMapper.deleteUser(empId);
	}

	@Override
	public int addDep(HttpServletRequest request) {
		String name = request.getParameter("name");
		String code = request.getParameter("code");
		String pCode = request.getParameter("parent");
		DeptEvo parent = DeptEvo.builder().code(pCode).build();
		DeptEvo dept = DeptEvo.builder()
			.name(name)
			.code(code)
			.parent(parent)
			.build();
		return this.adminMapper.insertDept(dept);
	}

	@Override
	public int addPos(HttpServletRequest request) {
		String name = request.getParameter("name");
		String code = request.getParameter("code");
		CommCodeEvo commcode = CommCodeEvo.builder()
			.name(name)
			.code(code)
			.catCode("P")
			.build();
		return this.adminMapper.insertCommCode(commcode);
	}

}
