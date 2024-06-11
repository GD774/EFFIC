package com.gd774.effic.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface ReserveService {
   int registerFacility(HttpServletRequest request);
   
   int modifyFacility(HttpServletRequest request);
   int removeFacility(int facilityNo);
   ResponseEntity<Map<String, Object>> getFacilityManageList(HttpServletRequest request);
   void loadCategoryList(Model model);
   void subCategoryList(String name);
}
