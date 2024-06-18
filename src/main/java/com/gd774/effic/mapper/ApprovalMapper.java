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
    List<AppDocDto> getMyDocListByDocState(Map<String, Object> map);
    List<AppDocDto> getMySaveDocList(Map<String, Object> map);
    List<AppDocDto> getMyAppDocList(Map<String, Object> map);
    List<AppDocDto> getDepDocList(Map<String, Object> map);
    List<AppDocDto> getAllDocById(Map<String, Object> map);
    List<AppDocDto> getAllDocs(Map<String, Object> map);
    List<AppDocDto> getDocByDocId(Map<String, Object> map);
   
    
    int updateAppDoc(AppDocDto appDoc);
    int updateDoc(DocDto doc);
    int updateDocItem(DocItemDto docItem);
    int updateApproval(ApprovalDto approval);
    
    AppDocDto getDocById(int docId);
    
    void approveDoc(AppDocDto appDoc);
    void rejectDoc(AppDocDto appDoc);
    
    int getDocCount(AppDocDto appDoc);

}
