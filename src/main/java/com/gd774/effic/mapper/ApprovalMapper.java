package com.gd774.effic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.ApprovalDto;
import com.gd774.effic.dto.approval.ApprovalMapDto;
import com.gd774.effic.dto.approval.DocDto;
import com.gd774.effic.dto.approval.DocItemDto;

@Mapper
public interface ApprovalMapper {
	
	void insertAppDoc(AppDocDto appDoc);
    void insertDoc(DocDto doc);
    void insertDocItem(DocItemDto docItem);
    void registerToApp(ApprovalDto approval);
    List<AppDocDto> getMyDocList(Map<String, Object> map);
    int getDocCount();
    ApprovalMapDto getDocById(@Param("docId") int docId);
    List<DocItemDto> getItemsByDocId(@Param("docId") int docId);
//    ApprovalMapDto getItemsByDocId(@Param("docId") int docId);
    List<AppDocDto> getMyDocListByDocState(Map<String, Object> map);
    List<AppDocDto> getDepDocListByDocState(Map<String, Object> map);
    
}
