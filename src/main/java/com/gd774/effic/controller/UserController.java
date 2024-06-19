package com.gd774.effic.controller;

import java.io.PrintWriter;

import com.gd774.effic.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RequestMapping(value = "/user")
@Controller
public class UserController {

	private final UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	@PostMapping(value = "signup")
	public void signup(HttpServletRequest request, HttpServletResponse response) {
		//
	}

	@PostMapping(value = "signout")
	public void signout(HttpServletRequest request, HttpServletResponse response) {
		//
	}

	@PostMapping(value = "signin")
	public String signin(HttpServletRequest request, HttpServletResponse response) {
		boolean result = userService.signin(request);
		if (! result)
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('일치하는 회원정보 없음')");
				out.println("</script>");
				return "/user/error";
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "redirect:/";
	}

	@PostMapping(value = "leave")
	public void leave(HttpServletRequest request, HttpServletResponse response) {
		//
	}
	
	@GetMapping(value = "calendar")
  public String calendartemp(HttpServletRequest request, HttpServletResponse response) {
    return "calendar/calendar";
  }

}
