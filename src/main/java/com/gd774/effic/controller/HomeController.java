package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RequestMapping(value = "/")
@Controller

public class HomeController {
	@GetMapping(value = "")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null)
			return "user/main";
		return "redirect:/signin";
	
	}

	@GetMapping(value = "signin")
	public String signin() {
		return "user/signin";
	}

	@PostMapping(value = "call_help")
	public void callHelp() {
		//
	}

	@GetMapping(value = "test")
	public String test() {
		return "user/main";
	}
}
