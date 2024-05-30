package com.gd774.effic.controller;

import java.io.PrintWriter;

import com.gd774.effic.service.AdminService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RequestMapping(value ="humanresource")
@Controller
public class HumanresourceController {

	private final AdminService adminservice;

	public HumanresourceController(AdminService adminservice) {
		this.adminservice = adminservice;
	}

	@PostMapping(value = "enroll")
	public void enroll(HttpServletRequest request, HttpServletResponse response) {
		int result = adminservice.enroll(request);
		try {
			response.setContentType("text/html; charset=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if (result != 1)
				out.println("alert('등록 실패');");
			else
				out.println("alert('등록 완료');");
			// out.println("location.href='" + request.getContextPath());
			out.println("history.back();");
			out.println("</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
