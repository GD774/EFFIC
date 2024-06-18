package com.gd774.effic.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gd774.effic.dto.UserDto;
import com.gd774.effic.service.MsgService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@RequestMapping(value = "/")
@Controller
public class HomeController {
  private final MsgService msgService;
  
  public HomeController(MsgService msgService) {
  this.msgService = msgService;
  }
  
  @GetMapping(value = "")
  public String main(HttpServletRequest request, HttpServletResponse response, Model model) {
    HttpSession session = request.getSession();
    if (session.getAttribute("user") != null) {
      
      UserDto user = (UserDto)request.getSession().getAttribute("user");
      String empId = user.getEmpId();
      
      model.addAttribute("noread", msgService.getUnReadCount(empId));
      
      return "user/main";}
    return "redirect:/signin";
  }

  @GetMapping(value = "signin")
  public String signin() {
    return "user/signin";
  }

  @GetMapping(value = "signout")
  public String signout(HttpServletRequest request, HttpServletRequest response) {
	HttpSession session = request.getSession();
	session.removeAttribute("user");
    return "redirect:/signin";
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
