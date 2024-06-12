package com.gd774.effic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.CategoryDto;
import com.gd774.effic.dto.FacilityManageDto;

@Mapper
public interface ReserveMapper {
  int insertFacility(FacilityManageDto facilityMng);
  List<CategoryDto> getCategoryList();
  int getCategoryCount();
  int getFacilityCount();
  List<FacilityManageDto> getFacilityList(Map<String, Object> map);
  List<CategoryDto> getMCategoryList();
  List<CategoryDto> getSCategoryList(String pcatCode);
  List<CategoryDto> listupSubCategory(String name);
}
