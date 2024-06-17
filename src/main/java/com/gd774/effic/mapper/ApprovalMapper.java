package com.gd774.effic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd774.effic.dto.approval.AppDocDto;
import com.gd774.effic.dto.approval.ApprovalDto;

import com.gd774.effic.dto.approval.DocDto;
import com.gd774.effic.dto.approval.DocItemDto;

@Mapper
public interface ApprovalMapper {
	
	void insertAppDoc(AppDocDto appDoc);
    void insertDoc(DocDto doc);
    void insertDocItem(DocItemDto docItem);
    void insertApprovalLine(ApprovalDto approvalDto);
    List<AppDocDto> getMyDocList(Map<String, Object> map);
    int getDocCount();
    AppDocDto getAppDocById(@Param("docId") int docId);
    List<DocItemDto> getItemsByDocId(@Param("docId") int docId);
//    ApprovalMapDto getItemsByDocId(@Param("docId") int docId);
    List<AppDocDto> getMyDocListByDocState(Map<String, Object> map);
    List<AppDocDto> getDepDocListByDocState(Map<String, Object> map);
    List<AppDocDto> getAllDocById(Map<String, Object> map);
    List<AppDocDto> getDocByDocId(Map<String, Object> map);
}
