package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = "/reservation")
public class ReserveController {
	
	@GetMapping(value = "reservestatus")
	public String getMethodName() {
		return "/reservation/reservestatus";
	}
	
	@GetMapping(value = "reserve1")
	public String room1() {
		return "/reservation/reserve1";
	}
	
	@GetMapping(value = "reservemanage")
	public String reservemanage() {
		return "/reservation/reservemanage" ;
	}
	
	@GetMapping(value = "facilitymanage")
	public String facilitymanage() {
		return "/reservation/facilitymanage";
	}
	
	@GetMapping(value = "settingroom")
	public String settingroomg() {
		return "/reservation/settingroom";
	}
	
	@GetMapping(value = "settingfacility")
	public String settingfacility() {
		return "/reservation/settingfacility";
	}
	
}
