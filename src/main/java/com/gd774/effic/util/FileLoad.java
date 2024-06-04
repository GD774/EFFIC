package com.gd774.effic.util;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.MsgAttachDto;
import com.gd774.effic.dto.MsgDto;

import lombok.Data;

@Component
@Data
public class FileLoad {

	private final MyFileUtils myFileUtils;
	
	public FileLoad(MyFileUtils myFileUtils) {
	   this.myFileUtils = myFileUtils;
	}
	
	public boolean registerUpload(MultipartHttpServletRequest multipartRequest, MsgDto msg) {

		//원래 이 앞에 게시글 등록하는 부분이 있다. 즉 아랫부분에서 파일이 없는경우 게시글만 등록하고 끝난다.
		//내 생각엔 이 InsertMsg 메소드 뒷부분에 이 클래스를 슝 소환해서 쓰면 될듯. 그 msg(dto) 친구를 파라라미터로 받으면 되지 싶다!
		
	    // 첨부 파일 처리하기
	    List<MultipartFile> files = multipartRequest.getFiles("files");
	    
	    // 첨부 파일이 없는 경우 : [MultipartFile[field="files", filename=, contentType=application/octet-stream, size=0]]
	    // 첨부 파일이 있는 경우 : [MultipartFile[field="files", filename=404.jpg, contentType=image/jpeg, size=63891]]
	    // System.out.println(files);

	    int insertAttachCount;
	    if(files.get(0).getSize() == 0) {
	      insertAttachCount = 1;  // 첨부가 없어도 files.size() 는 1 이다.
	    } else {
	      insertAttachCount = 0;
	    }
	    
	    for (MultipartFile multipartFile : files) {
	      
	      if(multipartFile != null && !multipartFile.isEmpty()) {
	        
	        String uploadPath = myFileUtils.getUploadPath();
	        File dir = new File(uploadPath);
	        System.out.println("====="+dir.getAbsolutePath());
	        if(!dir.exists()) {
	          dir.mkdirs();
	        }
	        
	        String originalFilename = multipartFile.getOriginalFilename();
	        String filesystemName = myFileUtils.getFilesystemName(originalFilename);
	        File file = new File(dir, filesystemName);
	        
	        try {

	          multipartFile.transferTo(file);
	          
	          
	          
	          // ATTACH_T 테이블에 추가하기
	          MsgAttachDto attach = MsgAttachDto.builder()
	                                .uploadPath(uploadPath)
	                                .filesysName(filesystemName)
	                                .originalName(originalFilename)
	                             //   .msgNo(msg.getMsgNo())   key로 미리 시퀀스에서 뺀 그 친구 여기 필요하다. 따로 빼서 가져다놔야 함.
	                              .build();
	          
	         // insertAttachCount += msgMapper.insertAttach(attach);
	          
	        } catch (Exception e) {
	          e.printStackTrace();
	        }
	        
	      }  // if
	      
	    }  // for
	    
	    return false; //(insertUploadCount == 1) && (insertAttachCount == files.size());
	    
	  }
	
	
	
	

}
