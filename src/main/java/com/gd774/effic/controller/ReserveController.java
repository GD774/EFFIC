package com.gd774.effic.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd774.effic.service.ReserveService;

import jakarta.servlet.http.HttpServletRequest;


@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/reservation")
public class ReserveController {

  private final ReserveService reserveService;
  
  @GetMapping("/roomstatus")
  public String reservestatus() {
    return "/reservation/roomstatus";
  }
  
  @GetMapping("/facilitystatus")
  public String facilitystatus() {
      return "/reservation/facilitystatus";
  }
  
  @GetMapping("/reserve1")
  public String room1() {
      return "/reservation/reserve1";
  }
  
  @GetMapping("/reserve2")
  public String room2() {
      return "/reservation/reserve2";
  }
  
  @GetMapping("/reserve3")
  public String room3() {
      return "/reservation/reserve3";
  }
  
  @GetMapping("/reserve4")
  public String room4() {
      return "/reservation/reserve4";
  }
  
  @GetMapping("/reserve5")
  public String room5() {
      return "/reservation/reserve5";
  }
  
  @GetMapping(value = "/reservemanage")
  public String reservemanage() {
    return "/reservation/reservemanage" ;
  }
  
  @GetMapping(value = "/facilitymanage")
  public String facilitymanage() {
    return "/reservation/facilitymanage" ;
  }
  
  @GetMapping(value = "/settingroom")
  public String settingroom() {
    return "/reservation/settingroom";
  }
  
  @GetMapping(value = "/settingfacility")
  public String settingfacility(Model model) {
    //int insertCount = reserveService.registerFacility(request);
    //redirectAttributes.addFlashAttribute("insertResult", insertCount == 1 ? "자산 등록 완료" : "등록 실패");
    reserveService.loadCategoryList(model);
    return "/reservation/settingfacility";
  }
  
  @PostMapping(value = "registerFacility.do", produces ="application/json")
  public ResponseEntity<Map<String, Object>> registerFacility(HttpServletRequest request){
    System.out.println("일로가니?");
    int insertCount = reserveService.registerFacility(request);
    System.out.println("일로도가니?" + insertCount);
      System.out.println(insertCount);
    return ResponseEntity.ok(Map.of("insertCount", insertCount));
  }
  
  @GetMapping(value = "/getFacilityList.do", produces = "application/json")
  public ResponseEntity<Map<String, Object>> getFacilityList(HttpServletRequest request) {
    System.out.println("나오는지 확인");
      return reserveService.getFacilityList(request);
  }
  
  @GetMapping(value = "/tree")
  public String getMethodName() {
    return "/reservation/tree";
  }
  
  
  
}
