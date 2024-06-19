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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd774.effic.dto.FacilityManageDto;
import com.gd774.effic.dto.FacilityReserveDto;
import com.gd774.effic.service.ReserveService;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestBody;



@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/reservation")
public class ReserveController {

  private final ReserveService reserveService;
  
  //회의실 예약 메인
  @GetMapping("/roomstatus")
  public String reservestatus() {
    return "/reservation/roomstatus";
  }
  
  // 회의실 관리 화면
  @GetMapping(value = "/reservemanage")
  public String reservemanage() {
    return "/reservation/reservemanage" ;
  }
  
  // 회의실 추가 화면
  @GetMapping(value = "/settingroom")
  public String settingroom() {
    return "/reservation/settingroom";
  }
  
  //공용물품 예약 메인
  @GetMapping("/facilitystatus")
  public String facilitystatus() {
      return "/reservation/facilitystatus";
  }
  
  //회의실1층 소
  @GetMapping("/reserve1")
  public String room1() {
      return "/reservation/reserve1";
  }
  
  //회의실1층 대
  @GetMapping("/reserve2")
  public String room2() {
      return "/reservation/reserve2";
  }
  
  //회의실3층 소
  @GetMapping("/reserve3")
  public String room3() {
      return "/reservation/reserve3";
  }
  
  //회의실3층 대
  @GetMapping("/reserve4")
  public String room4() {
      return "/reservation/reserve4";
  }
  
  // 컨퍼런스룸
  @GetMapping("/reserve5")
  public String room5() {
      return "/reservation/reserve5";
  }
  
  // 물품 관리 화면
  @GetMapping(value = "/facilitymanage")
  public String facilitymanage() {
    return "/reservation/facilitymanage" ;
  }
  
  // 물품 추가 버튼 클릭시 
  @GetMapping(value = "/settingfacility")
  public String settingfacility(Model model) {
    reserveService.loadCategoryList(model);
    return "/reservation/settingfacility";
  }
 
  // 물품 추가 완료
  @PostMapping(value = "/registerFacility.do")
  public String registerFacility(HttpServletRequest request, RedirectAttributes redirectAttributes){
    int insertCount = reserveService.registerFacility(request);
    redirectAttributes.addFlashAttribute("insertResult", insertCount == 1 ? "등록" : "실패");
    return "redirect:/reservation/facilitymanage";
  }
  
  // 물품 관리내 리스트 띄우기
  @GetMapping(value = "/getFacilityList.do", produces = "application/json")
  public ResponseEntity<Map<String, Object>> getFacilityList(HttpServletRequest request) {
    return reserveService.getFacilityList(request);
  }
  
  //물품 설정 화면 띄우기
  @GetMapping(value = "/editfacility.do")
  public String editFacility(@RequestParam int facilityId, Model model) {
     System.out.println("여긴오니??????" + reserveService.getFacilityById(facilityId));
     FacilityManageDto facility = reserveService.getFacilityById(facilityId);
     if (facility == null) {
       return "redirect:/error";
     }
     model.addAttribute("facility", facility);
    return "reservation/editfacility";
  }
  
  // 물품 수정 update
  @PostMapping(value = "/modifyfacility.do")
  public String modifyFacility(HttpServletRequest request, RedirectAttributes redirectAttributes) {
      int modifyCount = reserveService.modifyFacilityList(request);
      System.out.println(request.getParameter("facilityId"));
      System.out.println(modifyCount);
      redirectAttributes
        .addAttribute("facilityId", request.getParameter("facilityId"))
        .addFlashAttribute("modifyResult", modifyCount == 1 ? "수정" : "실패");
    return "redirect:/reservation/facilitymanage";
  }
  
  // 물품 삭제 
  @PostMapping("/removefacility.do")
  public String removeFacility(@RequestParam(value="facilityId", required=false, defaultValue="0") int facilityId
                                           , RedirectAttributes redirectAttributes) {
    int removeCount = reserveService.removeFacility(facilityId);
    redirectAttributes.addFlashAttribute("removeResult", removeCount == 1 ? "삭제" : "실패");
      return "redirect:/reservation/facilitymanage";
  }
  
  // 물품 예약 리스트 화면
  @GetMapping(value = "/getFacReserveList.do", produces = "application/json")
  public ResponseEntity<Map<String, Object>> getFacReserveList(HttpServletRequest request) {
    System.out.println("예약"+reserveService.getFacReserveList(request));
    return reserveService.getFacReserveList(request);
  }
  
//물품 대여 클릭시 db로 보내기
 @PostMapping(value = "/reservefac.do")
 public ResponseEntity<Map<String, Object>> insertFacReserve(HttpServletRequest request) {
   System.out.println("==========이거나오니");
     return ResponseEntity.ok(Map.of("insertFacility", reserveService.insertFacReserve(request)));
 }
 // 물품 대여한 내용 받아오기
 @GetMapping(value = "/getReserveFacility.do", produces = "application/json")
 public ResponseEntity<Map<String, Object>> getReserveFacility(HttpServletRequest request) {
   System.out.println("받아오기"+reserveService.getReserveFacility(request));  
   return reserveService.getReserveFacility(request);
 }
 
 
 
}
