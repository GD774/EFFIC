package com.gd774.effic.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface ReserveService {
   int registerFacility(HttpServletRequest request);
   ResponseEntity<Map<String, Object>> getFacilityList(HttpServletRequest request);
   void loadCategoryList(Model model);
   void subCategoryList(String name);
   
   int modifyFacilityList(HttpServletRequest request);
   
   ResponseEntity<Map<String, Object>> getFacReserveList(HttpServletRequest request);
}
