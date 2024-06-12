package com.gd774.effic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.CategoryDto;
import com.gd774.effic.dto.FacilityManageDto;

@Mapper
public interface ReserveMapper {
  int insertFacility(FacilityManageDto facilityMng);
  List<CategoryDto> getCategoryList();
  int getCategoryCount();
  List<CategoryDto> getMCategoryList();
  List<CategoryDto> getSCategoryList(String pcatCode);
  List<CategoryDto> listupSubCategory(String name);
}
