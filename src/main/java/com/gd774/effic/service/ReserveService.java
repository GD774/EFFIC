package com.gd774.effic.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.gd774.effic.dto.FacilityManageDto;
import com.gd774.effic.dto.FacilityReserveDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.xml.ws.Response;

public interface ReserveService {
   int registerFacility(HttpServletRequest request);
   ResponseEntity<Map<String, Object>> getFacilityList(HttpServletRequest request);
   void loadCategoryList(Model model);
   
   FacilityManageDto getFacilityById(int facilityId);
   int modifyFacilityList(HttpServletRequest request);
   int removeFacility(int facilityId);
   
   
   ResponseEntity<Map<String, Object>> getFacReserveList(HttpServletRequest request);
   int insertFacReserve(HttpServletRequest request);
   ResponseEntity<Map<String, Object>> getReserveFacility(HttpServletRequest request);
   
}
