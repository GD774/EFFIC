package com.gd774.effic.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gd774.effic.dto.MsgAttachDto;
import com.gd774.effic.dto.MsgDto;
import com.gd774.effic.dto.RecpDto;
import com.gd774.effic.dto.UserDto;
import com.gd774.effic.mapper.MsgMapper;
import com.gd774.effic.util.FileLoad;
import com.gd774.effic.util.MsgPaging;
import com.gd774.effic.util.MyFileUtils;

import jakarta.servlet.http.HttpServletRequest;

@Transactional
@Service
public class MsgServiceImpl implements MsgService {
 
	private final MsgMapper msgMapper;
	private final MsgPaging msgPaging;
	private final FileLoad fileLoad;
	private final MyFileUtils myFileUtils;

	public MsgServiceImpl(MsgMapper msgMapper, MsgPaging msgPaging, FileLoad fileLoad, MyFileUtils myFileUtils) {
		super();
		this.msgMapper = msgMapper;
        this.msgPaging = msgPaging;
        this.fileLoad = fileLoad;
        this.myFileUtils = myFileUtils;
	}
		


	@Override
	public int msgInsert(MultipartHttpServletRequest multipartRequest) {
		
		//MSG에 가장 먼저 삽입
		String title = multipartRequest.getParameter("title");
		String contents = multipartRequest.getParameter("contents");
		UserDto user = (UserDto)multipartRequest.getSession().getAttribute("user");
		
		String sender = user.getEmpId();
		
		MsgDto msg = MsgDto.builder()
				       .title(title)
				       .contents(contents)
				       .sender(sender)
				       .build();
		
		int insertMsgCount = msgMapper.insertMsg(msg);
		
		//첨부파일이 있을경우 MSG_ATTACH_T에 삽입
		fileLoad.doUpload(multipartRequest, msg);
				
		//RECP에 삽입
		String recipientParam = multipartRequest.getParameter("recp");
		
		String[] recipients = null;
		
		if (recipientParam != null && !recipientParam.isEmpty()) {
		    recipients = recipientParam.replaceAll(" ", "").split(",");
		}
		
		int inserRecpCount = 0;
		
		for (String recipient : recipients) {
			if (recipient != null && !recipient.isEmpty()) {

			   
				RecpDto recp = RecpDto.builder()
						.msgId(msg.getMsgId())
						.recipient(recipient)
						.build();
				
				inserRecpCount += msgMapper.insertRecp(recp);
				
				int UnreadCount = msgMapper.getUnReadCount(recipient);
			}
		}
		
		
		
		return insertMsgCount;
	}
	
	@Override
	public int msgInsertMe(MultipartHttpServletRequest multipartRequest) {
		
		String title = multipartRequest.getParameter("title");
		String contents = multipartRequest.getParameter("contents");
		UserDto user = (UserDto)multipartRequest.getSession().getAttribute("user");
		String sender = user.getEmpId();
		
		MsgDto msg = MsgDto.builder()
				       .title(title)
				       .contents(contents)
				       .sender(sender)
				       .build();
		
		int insertMsgCount = msgMapper.insertMe(msg);
		fileLoad.doUpload(multipartRequest, msg); 
		
		return insertMsgCount;
	}
	
	@Transactional(readOnly=true)
	@Override
	public ResponseEntity<Map<String, Object>> getToMeList(HttpServletRequest request) {
		// 페이징 처리
		UserDto user = (UserDto)request.getSession().getAttribute("user");
		String sender = user.getEmpId();
	    int total = msgMapper.getToMeCount(sender);
	    int display = 30;		 
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    msgPaging.setPaging(total, display, page);
	    
		
		Map<String, Object> map = Map.of("sender", sender, "begin", msgPaging.getBegin() 
                , "end", msgPaging.getEnd());
		
		return new ResponseEntity<>(Map.of("msgList", msgMapper.getToMeList(map), "total", total
                , "paging", msgPaging.getAsyncPaging()), HttpStatus.OK);
	}
	
	@Transactional(readOnly=true)
	@Override
	public ResponseEntity<Map<String, Object>> getSentList(HttpServletRequest request) {
		
		// 페이징 처리
		UserDto user = (UserDto)request.getSession().getAttribute("user");
		String sender = user.getEmpId();
	    int total = msgMapper.getMsgCount(sender);
	    int display = 30;		 
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    msgPaging.setPaging(total, display, page);
	    
		
		// 페이징처리 안하고 우선 ajax 작동하는지 부터 확인함 -> 확인 ok
		Map<String, Object> map = Map.of("sender", sender,"begin", msgPaging.getBegin() 
                , "end", msgPaging.getEnd());

		
		return new ResponseEntity<>(Map.of("msgList", msgMapper.getListMsg(map), "total", total
                , "paging", msgPaging.getAsyncPaging()), HttpStatus.OK);
	}
	
	@Transactional(readOnly=true)
	@Override
	public List<String> getRecipientList(int msgId) {
		return msgMapper.getRecipientList(msgId);
	}
	
	@Transactional(readOnly=true)
	@Override
	public MsgDto getSentDetail(int msgId) {
	       return msgMapper.getMsgDetail(msgId);
	}
	 
	@Transactional(readOnly=true)
	@Override
	public MsgDto getToMeDetail(int msgId) {
		return msgMapper.getToMeDetail(msgId);
	}
	 
	@Transactional(readOnly=true)
	@Override
	public List<MsgAttachDto> getAttachDetail(int msgId) {
		   return msgMapper.getMsgAttach(msgId);
			 
	}
	 

	@Override
	public ResponseEntity<Resource> download(HttpServletRequest request) {
		
		    int msgId = Integer.parseInt(request.getParameter("msgId"));
		    MsgAttachDto attach = msgMapper.getMsgOneAttach(msgId);
		    
		    File file = new File(attach.getUploadPath(), attach.getFilesysName());
		    Resource resource = new FileSystemResource(file);
		    
		    // 첨부 파일 없으면 다운로드 취소
		    if(!resource.exists()) {
		      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		    }
		    
		    
		    String originalFilename = attach.getOriginalName();
		    String userAgent = request.getHeader("User-Agent");  
		    try { 
		      
		      // IE
		      if(userAgent.contains("Trident")){ 
		        originalFilename = URLEncoder.encode(originalFilename, "UTF-8").replace("+", ""); 
		      }
		      // Edge
		      else if(userAgent.contains("Edg")){   
		        originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		      }
		    
		      else {
		      // originalFilename = new String(originalFilename.getBytes(""), "ISO-8859-1");
		    	  originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		    	  // 으ㅏ아아아아 됐다!!!!!!!! 이거 노션에 쓰겠다 ㅠㅠㅠㅠㅠㅠㅠ 쓸것임 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
		    	  // 쿼리는 꼭 돌려보고 해야한다는 거 쓰고(selectOne) 서브쿼리는 등에서 별명은 스코프안에서만 유효하다는 것도 쓸거임 ㅠㅠ
		      }
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		    

		    
		    // 다운로드용 응답 헤더 설정 (HTTP 참조)
		    HttpHeaders responseHeader = new HttpHeaders();
		    responseHeader.add("Content-Type", "application/octet-stream");
		    responseHeader.add("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		    responseHeader.add("Content-Length", file.length() + "");
		    
		    
		    
		    // 다운로드 진행
		    return new ResponseEntity<Resource>(resource, responseHeader, HttpStatus.OK);
	}
	 
	 @Override
	public ResponseEntity<Resource> downloadAll(int msgId) {


		    List<MsgAttachDto> attachList = msgMapper.getMsgAttach(msgId);
		    
		    
		    if(attachList.isEmpty()) {
		      return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		    }
		    
		    File tempDir = new File(myFileUtils.getTempPath());
		    if (!tempDir.exists()) {
		     tempDir.mkdirs(); 
		    }
		    
		    String tempFilename = myFileUtils.getTempFilename() + ".zip";
		    
		    File tempfile = new File(tempDir, tempFilename);
		    
		    try {
		      
		      ZipOutputStream zout = new ZipOutputStream(new FileOutputStream(tempfile));
		      
		      for (MsgAttachDto attach : attachList) {
		        
		        ZipEntry zipEntry = new ZipEntry(attach.getOriginalName());
		        
		        zout.putNextEntry(zipEntry);
		        
		        BufferedInputStream in = new BufferedInputStream(new FileInputStream(new File(attach.getUploadPath(), attach.getFilesysName())));
		        zout.write(in.readAllBytes());  
		        
		        in.close();
		        zout.closeEntry();

		        
		      } 
		      

		      zout.close();
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		    
		     Resource resource = new FileSystemResource(tempfile);
		    
		     
		     HttpHeaders responseHeader = new HttpHeaders();
		     responseHeader.add("Content-Type", "application/octet-stream");
		     responseHeader.add("Content-Disposition", "attachment; filename=" + tempFilename);
		     responseHeader.add("Content-Length", tempfile.length() + ""); //file.length()가 long 이라서 "" 더해서 String 으로 만들어줌
		     
		     return new ResponseEntity<Resource>(resource, responseHeader, HttpStatus.OK);
	}
	 
	@Transactional(readOnly=true)
	@Override
	public ResponseEntity<Map<String, Object>> getInboxList(HttpServletRequest request) {
		
		 UserDto user = (UserDto)request.getSession().getAttribute("user");
			String recipient = user.getEmpId();
		    int total = msgMapper.getRcpCount(recipient);
		    int display = 30;		 // 화면 봐가면서 몇개가 적당할지 찾기. 15 아님 20 아님 25
			Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		    int page = Integer.parseInt(opt.orElse("1"));
		    msgPaging.setPaging(total, display, page);
		    
		    

			Map<String, Object> map = Map.of("recipient", recipient,"begin", msgPaging.getBegin() 
	                , "end", msgPaging.getEnd());
			
			return new ResponseEntity<>(Map.of("recpList", msgMapper.getListRcp(map), "total", total
	                , "paging", msgPaging.getAsyncPaging(),"noRead", msgMapper.countNoRead(recipient)), HttpStatus.OK);
		
	}
	
	@Transactional(readOnly=true)
	@Override
	public MsgDto getInboxDetail(int msgId, HttpServletRequest request) {
		 
		UserDto user = (UserDto)request.getSession().getAttribute("user");
	    String recipient = user.getEmpId();
		Map<String, Object> map = Map.of("msgId", msgId, "recipient", recipient);
		msgMapper.updateReadDt(map);
		return msgMapper.getRcpDetail(map);
	}
	 
	 @Override
	public int updateSentChkImpt(int msgId) {
		 
         return msgMapper.updateSentChkImpt(msgId);
	}
	 
	 @Override
	public int updateSentOnlyChkImpt(int msgId) {
		 
         return msgMapper.updateSentOnlyChkImpt(msgId);
	}
	 
	 @Override
	public int updateInboxChkImpt(int recpId) {
		
		return msgMapper.updateInboxChkImpt(recpId);
	}
	 
	 @Override
	public int updateInboxOnlyChkImpt(int recpId) {
		
		return msgMapper.updateInboxOnlyChkImpt(recpId);
	}
	 
	 @Transactional(readOnly=true)
	 @Override
	public ResponseEntity<Map<String, Object>> getImpList(HttpServletRequest request) {

		 UserDto user = (UserDto)request.getSession().getAttribute("user");
			String recipient = user.getEmpId();
			String sender = user.getEmpId();
			Map<String, Object> getTotal = Map.of("recipient", recipient, "sender", sender);
		    int total = msgMapper.getImpCount(getTotal);
		    int display = 30;	
			Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		    int page = Integer.parseInt(opt.orElse("1"));
		    msgPaging.setPaging(total, display, page);
		    

			Map<String, Object> map = Map.of("recipient", recipient, "sender", sender, "begin", msgPaging.getBegin() 
	                , "end", msgPaging.getEnd());
			
			return new ResponseEntity<>(Map.of("impList", msgMapper.getImpList(map), "total", total
	                , "paging", msgPaging.getAsyncPaging()), HttpStatus.OK);
	}

	 @Override
	public int cancelInboxChkImp(int recpId) {
		return msgMapper.cancelInboxImpList(recpId);
	}
	 
	 @Override
	public int cancelSentChkImp(int msgId) {
		// TODO Auto-generated method stub
		return msgMapper.cancelSentImpList(msgId);
	}
	 
	 
	 @Override
	 public int updateSentToBin(int msgId) {
		 
		 int UpdateCount = 0;
		 
		 
		 return UpdateCount = msgMapper.updateSentTobBin(msgId);
	 }
	 
	@Override
	public int updateInboxToBin(int recpId) {
		int UpdateCount = 0;
		
		return UpdateCount = msgMapper.updateInboxToBin(recpId);
	}
	
	@Transactional(readOnly=true)
	@Override
	public ResponseEntity<Map<String, Object>> getBinList(HttpServletRequest request) {
		
		 UserDto user = (UserDto)request.getSession().getAttribute("user");
			String recipient = user.getEmpId();
			String sender = user.getEmpId();
			
			Map<String, Object> getTotal = Map.of("recipient", recipient, "sender", sender);
		    int total = msgMapper.getBinCount(getTotal);

		    int display = 30;		 
			Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		    int page = Integer.parseInt(opt.orElse("1"));
		    msgPaging.setPaging(total, display, page);
		    

			Map<String, Object> map = Map.of("recipient", recipient, "sender", sender, "begin", msgPaging.getBegin() 
	                , "end", msgPaging.getEnd());
			
			return new ResponseEntity<>(Map.of("binList", msgMapper.getBinList(map), "total", total
	                , "paging", msgPaging.getAsyncPaging()), HttpStatus.OK);
	}
	
	
	@Override
	public int updateMsgRemove(int msgid) {
		
		int updateCount = 0;
		return updateCount = msgMapper.updateMsgRemove(msgid);
	}
	
	@Override
	public int updateRcpRemove(int recpId) {

		int updateCount = 0;
		return updateCount = msgMapper.updateRcpRemove(recpId);
	}
	
	@Override
	public int cancelInboxBin(int recpId) {
		
		int updateCount = 0;
		return updateCount = msgMapper.cancelInboxBin(recpId);
	}
	
	@Override
	public int cancelSentBin(int msgId) {

		int updateCount = 0;
		
		return updateCount = msgMapper.cancelSentBin(msgId);
	}
	

	@Override
	public int clearBin() {
		
		int updateCount = 0;
		
		updateCount =+ msgMapper.allRemoveMsg();
		updateCount =+ msgMapper.allRemoveRecp();
		
		return updateCount;
	}
	
	@Override
	public int getUnReadCount(String recipient) {
        
		return msgMapper.getUnReadCount(recipient);
	}
	
	
	//팀메세지 등록
	@Override
	public List<String> getTeamRegister(String depId, String empId) {
         
		return msgMapper.getTeamRegister(depId, empId);
	}
	
	
	@Override
	public int IsMsgId(int recpId) {
		
		
		return msgMapper.IsMsgId(recpId);
	}
	
	@Override
	public ResponseEntity<Map<String, Object>> getInboxTeamList(HttpServletRequest request) {
		UserDto user = (UserDto)request.getSession().getAttribute("user");
		String recipient = user.getEmpId();
		String depId = user.getDepId();
		Map<String, Object> forCount = Map.of("recipient", recipient, "depId", depId);
	    int total = msgMapper.getTeamInboxCount(forCount);
	    int display = 30;		 // 화면 봐가면서 몇개가 적당할지 찾기. 15 아님 20 아님 25
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    msgPaging.setPaging(total, display, page);
	    
	    

		Map<String, Object> map = Map.of("recipient", recipient, "depId" , depId, "begin", msgPaging.getBegin() 
                , "end", msgPaging.getEnd());
		
		return new ResponseEntity<>(Map.of("recpList", msgMapper.getTeamInboxList(map), "total", total
                , "paging", msgPaging.getAsyncPaging(),"noRead", msgMapper.countNoRead(recipient)), HttpStatus.OK);
	}
	
}




