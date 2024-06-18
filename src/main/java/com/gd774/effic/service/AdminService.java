package com.gd774.effic.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.gd774.effic.dto.evo.CommCodeEvo;
import com.gd774.effic.dto.evo.DeptEvo;
import com.gd774.effic.dto.evo.UserEvo;

import jakarta.servlet.http.HttpServletRequest;

@Service
public interface AdminService {
	public ArrayList<UserEvo> getUsers();
	public ArrayList<DeptEvo> getDepts();
	public ArrayList<CommCodeEvo> getPositions();
	public int getDepInfo(HttpServletRequest request);
	public int getPosInfo(HttpServletRequest request);
	public int addUser(HttpServletRequest request);
	public int delUser(HttpServletRequest request);
	public int addDep(HttpServletRequest request);
	public int addPos(HttpServletRequest request);
	public int delDep(HttpServletRequest request);
	public int delPos(HttpServletRequest request);
}
