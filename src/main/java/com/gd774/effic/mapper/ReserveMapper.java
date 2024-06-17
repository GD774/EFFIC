package com.gd774.effic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.CategoryDto;
import com.gd774.effic.dto.FacilityManageDto;
import com.gd774.effic.dto.FacilityReserveDto;

@Mapper
public interface ReserveMapper {
  int insertFacility(FacilityManageDto facilityMng);
  List<CategoryDto> getCategoryList();
  int getCategoryCount();
  int getFacilityCount();
  List<FacilityManageDto> getFacilityList(Map<String, Object> map);
  List<CategoryDto> getMCategoryList();
  List<CategoryDto> getSCategoryList(String pcatCode);
  
  int getFacReserveCount();
  List<FacilityReserveDto> getFacReserveList(Map<String, Object> map); 
  int getFacReserve(FacilityReserveDto facReserve); 
  
  FacilityManageDto getFacilityById(int rentState);
  int updateFacilityList(FacilityManageDto facility);
  int deleteFacilityList(int facilityId);
  
  int insertFacReserve(FacilityReserveDto facility);
  List<FacilityReserveDto> getFacReserve(Map<String, Object> map);
}
