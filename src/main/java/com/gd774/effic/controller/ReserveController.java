package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = "/reservation")
public class ReserveController {
	
	@GetMapping(value = "roomstatus")
	public String reservestatus() {
		return "/reservation/roomstatus";
	}
	
	@GetMapping(value = "facilitystatus")
	public String facilitystatus() {
		return "/reservation/facilitystatus";
	}
	
	@GetMapping(value = "reserve1")
	public String room1() {
		return "/reservation/reserve1";
	}
	
	@GetMapping(value = "reserve2")
	public String room2() {
		return "/reservation/reserve2";
	}
	
	@GetMapping(value = "reserve3")
	public String room3() {
		return "/reservation/reserve3";
	}
	
	@GetMapping(value = "reserve4")
	public String room4() {
		return "/reservation/reserve4";
	}
	
	@GetMapping(value = "reserve5")
	public String room5() {
		return "/reservation/reserve5";
	}
	
	@GetMapping(value = "reservemanage")
	public String reservemanage() {
		return "/reservation/reservemanage" ;
	}
	
	@GetMapping(value = "facilitymanage")
	public String facilitymanage() {
		return "/reservation/facilitymanage" ;
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
