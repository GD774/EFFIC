package com.gd774.effic.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.gd774.effic.dto.evo.CommCodeEvo;
import com.gd774.effic.dto.evo.DeptEvo;
import com.gd774.effic.dto.evo.UserEvo;
import com.gd774.effic.service.AdminService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RequestMapping(value = "/admin")
@Controller
public class AdminController {
	private final AdminService adminService;

	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}

	@GetMapping(value = "getUsers")
	@ResponseBody
	public ArrayList<UserEvo> getUsers() {
		return this.adminService.getUsers();
	}

	@GetMapping(value = "getDepData")
	@ResponseBody
	public Map<String, ArrayList> getDepData() {
		Map<String, ArrayList> map = new HashMap<>();
		map.put("users", this.adminService.getUsers());
		map.put("depts", this.adminService.getDepts());
		return map;
	}

	@GetMapping(value = "getPosData")
	@ResponseBody
	public ArrayList<CommCodeEvo> getPosData() {
		return this.adminService.getPositions();
	}

	@PostMapping(value = "addUser")
	@ResponseBody
	public void addUser(HttpServletRequest request) {
		this.adminService.addUser(request);
	}

	@PostMapping(value = "delUser")
	@ResponseBody
	public void delUser(HttpServletRequest request) {
		this.adminService.delUser(request);
	}

	@PostMapping(value = "addDep")
	@ResponseBody
	public void addDep(HttpServletRequest request) {
		this.adminService.addDep(request);
	}

	@PostMapping(value = "addPos")
	@ResponseBody
	public void addPos(HttpServletRequest request) {
		this.adminService.addPos(request);
	}

	@GetMapping(value = "userlist")
	public String userlist() {
		return "admin/userlist";
	}

	@GetMapping(value = "org")
	public String org() {
		return "admin/orginfo";
	}
}
