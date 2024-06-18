package com.gd774.effic.service;

import java.util.Arrays;
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
		 ArrayList<CommCodeEvo> pos = adminMapper.selectCommCodes("P");
		 System.out.println("!!!!!!!!!!!!!!system message!!!!!!!!!!!!!!!!!!");
		 System.out.println("positions are: " + Arrays.deepToString(pos.toArray()));
		 return pos;
	}

	@Override
	public int getDepInfo(HttpServletRequest request) {
		String code = request.getParameter("code");
		ArrayList<UserEvo> users = adminMapper.selectUsers();
		int cnt = 0;
		for (UserEvo u: users)
			if (u.getDept() != null && u.getDept().getCode().equals(code))
				cnt++;

		return cnt;
	}

	@Override
	public int getPosInfo(HttpServletRequest request) {
		String code = request.getParameter("code");
		ArrayList<UserEvo> users = adminMapper.selectUsers();
		int cnt = 0;
		for (UserEvo u: users)
			if (u.getPos() != null && u.getPos().getCode().equals(code))
				cnt++;

		return cnt;
	}

	@Override
	public int addUser(HttpServletRequest request) {
		String empId = request.getParameter("empId");
		String pw = BasicSecurity.getHash(request.getParameter("pw"), BasicSecurity.SHA256);
		String name = request.getParameter("name");
		Optional<String> opt = Optional.ofNullable(request.getParameter("depId"));
		String depId = opt.orElse(null);
		opt = Optional.ofNullable(request.getParameter("posId"));
		String posId = opt.orElse(null);

		DeptEvo dep = DeptEvo.builder().code(depId).build();
		CommCodeEvo pos = CommCodeEvo.builder().code(posId).build();

		UserEvo user = UserEvo.builder()
			.empId(empId)
			.pw(pw)
			.name(name)
			.dept(dep)
			.pos(pos)
			.build();
		return adminMapper.insertUser(user);
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

	@Override
	public int delUser(HttpServletRequest request) {
		String empId = request.getParameter("empId");
		return adminMapper.deleteUser(empId);
	}

	@Override
	public int delDep(HttpServletRequest request) {
		String code = request.getParameter("code");
		return adminMapper.deleteDep(code);
	}

	@Override
	public int delPos(HttpServletRequest request) {
		String code = request.getParameter("code");
		return adminMapper.deleteComm(code, "P");
	}

}
