package com.gd774.effic.controller;

import com.gd774.effic.service.AdminService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RequestMapping(value = "/admin")
@Controller
public class AdminController {
	private final AdminService adminService;

	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}

	@GetMapping(value = "main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/admin-main";
	}

	@GetMapping(value = "enroll")
	public String enroll(Model model) {
		model.addAttribute("userList", adminService.getUserList());
		return "humanresource/enroll";
	}

	@PostMapping(value = "enroll")
	public void enroll(HttpServletRequest request, HttpServletResponse response) {
		//
	}

	@PostMapping(value = "decline")
	public void decline(HttpServletRequest request, HttpServletResponse response) {
		//
	}
}
