package com.gd774.effic.service;

import java.util.HashMap;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gd774.effic.dto.CategoryDto;
import com.gd774.effic.dto.FacilityManageDto;
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
    int facilityState = Integer.parseInt(request.getParameter("facilityState"));
    int rentTerm = Integer.parseInt(request.getParameter("rentTerm"));
    String catCode = request.getParameter("catCode");

    FacilityManageDto facilityMng = FacilityManageDto.builder()
                                      .facilityState(facilityState)
                                      .modelName(modelName)
                                      .buyDt(buyDt)
                                      .rentTerm(rentTerm)
                                      .catCode(catCode)
                                      .build();
     
    System.out.println("잘 나옴?" + facilityMng);
    return reserveMapper.insertFacility(facilityMng);
  }

  @Override
  public int modifyFacility(HttpServletRequest request) {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int removeFacility(int facilityNo) {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public ResponseEntity<Map<String, Object>> getFacilityList(HttpServletRequest request) {
    
    int total = reserveMapper.getFacilityCount();
    System.out.println(total);
    int display = 10;
    int page = Integer.parseInt(request.getParameter("page"));
    pageUtils.setPaging(total, display, page);
    Map<String, Object> map = Map.of("begin", pageUtils.getBegin()
                                   , "end", pageUtils.getEnd());
    
    return new ResponseEntity<>(Map.of("getFacilityList", reserveMapper.getFacilityList(map)
                                     , "totalPage", pageUtils.getTotalPage())
                               , HttpStatus.OK);
  }

  @Override
  public void loadCategoryList(Model model) {
  List<CategoryDto> mCatList = reserveMapper.getMCategoryList();
  Map<String, List<CategoryDto>> map = new HashMap<>();
  //List<CategoryDto> sCatList = reserveMapper.getSCategoryList(null);
  for(CategoryDto c : mCatList) {
      map.put(c.getCatCode(),reserveMapper.getSCategoryList(c.getCatCode()));
  }
  //model.addAttribute("mCatList1", mCatList.get(0).getCatName());

  model.addAttribute("mCatList", mCatList);
 // model.addAttribute("sCatList", sCatList);
  model.addAttribute("map", map);

  //System.out.println(sCatList.get(3).getCatName());
  
  }
  
  @Override
  public void subCategoryList(String name) {
    List<CategoryDto> listupSubCategory = reserveMapper.listupSubCategory(name);
    System.out.println(listupSubCategory);
  }
    
}
