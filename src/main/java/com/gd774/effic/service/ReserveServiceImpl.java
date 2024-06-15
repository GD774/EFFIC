package com.gd774.effic.service;

import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import org.springframework.core.io.AbstractFileResolvingResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gd774.effic.dto.CategoryDto;
import com.gd774.effic.dto.FacilityManageDto;
import com.gd774.effic.dto.FacilityReserveDto;
import com.gd774.effic.mapper.ReserveMapper;
import com.gd774.effic.util.PageUtils;

import jakarta.servlet.http.HttpServletRequest;

@Transactional
@Service
public class ReserveServiceImpl implements ReserveService {

  private final ReserveMapper reserveMapper;
  private final PageUtils pageUtils;
  
  public ReserveServiceImpl(ReserveMapper reserveMapper, PageUtils pageUtils) {
    super();
    this.reserveMapper = reserveMapper;
    this.pageUtils = pageUtils;
  }

  @Override
  public int registerFacility(HttpServletRequest request) {
    System.out.println("catCode:" + request.getParameter("catCode"));
    String modelName = request.getParameter("modelName");
    String buyDt = request.getParameter("buyDt");
    System.out.println("이건 상태"+Integer.parseInt(request.getParameter("facilityState")));
    System.out.println("이건대여"+Integer.parseInt(request.getParameter("rentTerm")));
    int facilityState = Integer.parseInt(request.getParameter("facilityState"));
    int rentTerm = Integer.parseInt(request.getParameter("rentTerm"));
    String catCode = request.getParameter("catCode");
    String catType = request.getParameter("catType");

    String date = buyDt.replace("/", "");
    date = date.substring(0, 4) + date.substring(6, 8);
    
   // String facilityCode = catCode + catType + date + facilityId; 
    
    CategoryDto cat = new CategoryDto();
    cat.setCatCode(catCode);
    
    
    FacilityManageDto facilityMng = FacilityManageDto.builder()
                                      .facilityState(facilityState)
                                      .modelName(modelName)
                                      .buyDt(buyDt)
                                      .rentTerm(rentTerm)
                                      .cat(cat)
                                      .build();
     
    int insertCount = reserveMapper.insertFacility(facilityMng);
    
    return insertCount;
  }
  
  @Override
  public ResponseEntity<Map<String, Object>> getFacilityList(HttpServletRequest request) {
    
    try {
      int total = reserveMapper.getFacilityCount();
      int display = 10;
      int page = Integer.parseInt(request.getParameter("page"));
      pageUtils.setPaging(total, display, page);
      Map<String, Object> map = Map.of("begin", pageUtils.getBegin()
                                     , "end", pageUtils.getEnd());
      return new ResponseEntity<>(Map.of("getFacilityList", reserveMapper.getFacilityList(map)
                                , "totalPage", pageUtils.getTotalPage())
                                ,  HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return null;

  }


  @Override
  public void loadCategoryList(Model model) {
  List<CategoryDto> mCatList = reserveMapper.getMCategoryList();
  Map<String, List<CategoryDto>> map = new HashMap<>();
  for(CategoryDto c : mCatList) {
      map.put(c.getCatCode(),reserveMapper.getSCategoryList(c.getCatCode()));
  }
  model.addAttribute("mCatList", mCatList);
  model.addAttribute("map", map);
  }
  
  @Override
  public void subCategoryList(String name) {
    List<CategoryDto> listupSubCategory = reserveMapper.listupSubCategory(name);
    System.out.println(listupSubCategory);
  }
  
  @Override
  public FacilityManageDto getFacilityById(int facilityId) {
    System.out.println(reserveMapper.getFacilityById(facilityId));
    return reserveMapper.getFacilityById(facilityId);
  }
  
  @Override
  public int modifyFacilityList(HttpServletRequest request) {
    try {
      int facilityId = Integer.parseInt(request.getParameter("facilityId"));
      int facilityState = Integer.parseInt(request.getParameter("facilityState"));
      int rentTerm = Integer.parseInt(request.getParameter("rentTerm"));
      FacilityManageDto facility = FacilityManageDto.builder()
          .facilityId(facilityId)
          .facilityState(facilityState)
          .rentTerm(rentTerm)
          .build();
      
      int modifyResult = reserveMapper.updateFacilityList(facility);
      return modifyResult;
            
    } catch (Exception e) {
      return 0;
    }
      
  }
  
  
  
  
  
  @Override
  public ResponseEntity<Map<String, Object>> getFacReserveList(HttpServletRequest request) {
  
    int total = reserveMapper.getFacilityCount();
    int display = 5;
    int page = Integer.parseInt(request.getParameter("page"));
    pageUtils.setPaging(total, display, page);
    Map<String, Object> map = Map.of("begin", pageUtils.getBegin()
                                   , "end", pageUtils.getEnd());
    System.out.println(reserveMapper.getFacReserveList(map));
    
    return new ResponseEntity<>(Map.of("getFacReserveList", reserveMapper.getFacReserveList(map)
                                      ,"totalPage", pageUtils.getTotalPage())
                                      , HttpStatus.OK);
  }
  
}