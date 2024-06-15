package com.gd774.effic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.dto.approval.AppAttachDto;
import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.DocDto;
import com.gd774.effic.dto.approval.DocItemDto;

@Mapper
public interface ApprovalMapper {

    void registerApproval(AppDocDto appDoc);
    void insertDoc(DocDto docTemplate);
    void insertDocItem(DocItemDto docItem);
    int selectDocId(@Param("empId") String empId, 
    				@Param("depId") String depId, 
    				@Param("title") String title); 
    List<Map<String, Object>> getMyDocList();
}
