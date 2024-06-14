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
			   System.out.println(recipient);
			   
				RecpDto recp = RecpDto.builder()
						.msgId(msg.getMsgId())
						.recipient(recipient)
						.build();
				
				inserRecpCount += msgMapper.insertRecp(recp);
				
				int UnreadCount = msgMapper.getUnReadCount(recipient);
			}
		}
		
		
		
		// 이거 나중에 수정.
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
	    int display = 10;		 
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
	    int display = 10;		 // 화면 봐가면서 몇개가 적당할지 찾기. 15 아님 20 아님 25
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    msgPaging.setPaging(total, display, page);
	    
		
		// 페이징처리 안하고 우선 ajax 작동하는지 부터 확인함
		Map<String, Object> map = Map.of("sender", sender,"begin", msgPaging.getBegin() 
                , "end", msgPaging.getEnd());
		
		System.out.println(msgPaging.getBegin());
		System.out.println(msgPaging.getEnd());
		
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
		
		 // 첨부 파일 정보를 DB 에서 가져오기
		    int msgId = Integer.parseInt(request.getParameter("msgId"));
		    MsgAttachDto attach = msgMapper.getMsgOneAttach(msgId);
		    
		    // 첨부 파일 정보를 File 객체로 만든 뒤 Resource 객체로 변환
		    File file = new File(attach.getUploadPath(), attach.getFilesysName()); //경로, 파일명
		    Resource resource = new FileSystemResource(file);
		    
		    // 첨부 파일 없으면 다운로드 취소
		    // 이런식으로 데이터가 필요없을 때는 응답코드 만으로도 메소드 반환해주고 끝낼 수 있다.
		    if(!resource.exists()) {
		      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		    }
		    
		    
		    // 사용자가 다운로드 받을 파일명 결정 (originalFilename을 기본적으로 사용. originalFilename을 브라우저에 따라 다르게 인코딩 처리(주어MS))
		    String originalFilename = attach.getOriginalName();
		    String userAgent = request.getHeader("User-Agent");  // 처음에 헤더 배울때 이런게 했었죠...기억이 새록새록...
		    try { // 플랫폼에 종속적인 소프트웨어들이 있는데...더이상 업데이트를 못해서 울며 겨자먹기로 그 플랫폼 써야만 하는 경우들이 있음. 수두룩함....
		      
		      // IE
		      if(userAgent.contains("Trident")){ //Trident가 포함되어 있으면 IE
		        originalFilename = URLEncoder.encode(originalFilename, "UTF-8").replace("+", ""); // +가 나오면 공백으로 바꿔준다.
		      }
		      // Edge
		      else if(userAgent.contains("Edg")){     //Edg가 포함되어 있으면 Edge
		        originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		      }
		      // Other 그 외 모던 브라우저들
		      else {
		      // originalFilename = new String(originalFilename.getBytes(""), "ISO-8859-1");
		    	  originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		    	  // 으ㅏ아아아아 됐다!!!!!!!! 이거 노션에 쓰겠다 ㅠㅠㅠㅠㅠㅠㅠ 쓸것임 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
		    	  // 쿼리는 꼭 돌려보고 해야한다는 거 쓰고(selectOne) 서브쿼리는 등에서 별명은 스코프안에서만 유효하다는 것도 쓸거임 ㅠㅠ
		      }
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		    
		    System.out.println(originalFilename);
		    
		    // 다운로드용 응답 헤더 설정 (HTTP 참조)
		    HttpHeaders responseHeader = new HttpHeaders();
		    responseHeader.add("Content-Type", "application/octet-stream");
		    responseHeader.add("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		    responseHeader.add("Content-Length", file.length() + "");
		    
		    System.out.println("다운로드 서비스 돎");
		    
		    
		    // 다운로드 진행
		    return new ResponseEntity<Resource>(resource, responseHeader, HttpStatus.OK);
	}
	 
	 @Override
	public ResponseEntity<Resource> downloadAll(int msgId) {

		  // 다운로드할 모든 첨부 파일들의 정보를 DB 에서 가져오기

		    List<MsgAttachDto> attachList = msgMapper.getMsgAttach(msgId);
		    
		   // MsgAttachDto firstAttach = attachList.get(0);
		   // String tempFilename = firstAttach.getOriginalName() + "외";
		    
		    // 첨부 파일이 없으면 종료
		    if(attachList.isEmpty()) {
		      return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		    }
		    
		    // 임시 zip 파일 저장할 경로
		    File tempDir = new File(myFileUtils.getTempPath());
		    if (!tempDir.exists()) {
		     tempDir.mkdirs(); 
		    }
		    
		    // 임시 zip 파일 이름
		    String tempFilename = myFileUtils.getTempFilename() + ".zip";
		    
		    // 임시 zip 파일 File 객체
		    File tempfile = new File(tempDir, tempFilename);
		    
		    // 첨부 파일들을 하나씩 zip 파일로 모으기
		    try {
		      
		      // ZipOutputStream 객체 생성
		      ZipOutputStream zout = new ZipOutputStream(new FileOutputStream(tempfile));
		      
		      for (MsgAttachDto attach : attachList) {
		        
		        // zip 파일에 포함할 ZipEntry 객체 생성
		        ZipEntry zipEntry = new ZipEntry(attach.getOriginalName()); // zip 파일에 들어갈 개별 파일의 이름
		        
		        // zip 파일에 ZipEntry 객체 명단 추가 (파일의 이름만 등록한 상황)
		        zout.putNextEntry(zipEntry);
		        
		        // 실제 첨부 파일을 zip 파일에 등록 (첨부 파일을 읽어서 zip 파일로 보냄. 읽어들이는 건 InputStream) 
		        BufferedInputStream in = new BufferedInputStream(new FileInputStream(new File(attach.getUploadPath(), attach.getFilesysName())));
		        zout.write(in.readAllBytes());  // 싹 다 읽어오는 메소드
		        
		        // 사용한 자원 정리
		        in.close();
		        zout.closeEntry();

		        
		      } // for문 종료
		      
		      // zout 자원 반납
		      zout.close();
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		    
		    // 다운로드 할 zip File 객체 -> Resource 객체
		     Resource resource = new FileSystemResource(tempfile);
		    
		     // 임시파일의 이름이 숫자(TIMPESTAMP)로 되어있기 때문에 인코딩을 할 필요가 없다.
		     
		     // 다운로드용 응답 헤더 설정 (HTTP 참조)
		     HttpHeaders responseHeader = new HttpHeaders();
		     responseHeader.add("Content-Type", "application/octet-stream");
		     responseHeader.add("Content-Disposition", "attachment; filename=" + tempFilename);
		     responseHeader.add("Content-Length", tempfile.length() + ""); //file.length()가 long 이라서 "" 더해서 String 으로 만들어줌
		     
		     System.out.println("다운로드 서비스 돎");
		     // 다운로드 진행
		     return new ResponseEntity<Resource>(resource, responseHeader, HttpStatus.OK);
	}
	 
	@Transactional(readOnly=true)
	@Override
	public ResponseEntity<Map<String, Object>> getInboxList(HttpServletRequest request) {
		
		 UserDto user = (UserDto)request.getSession().getAttribute("user");
			String recipient = user.getEmpId();
		    int total = msgMapper.getRcpCount(recipient);
		    int display = 10;		 // 화면 봐가면서 몇개가 적당할지 찾기. 15 아님 20 아님 25
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
		    int display = 10;		 // 화면 봐가면서 몇개가 적당할지 찾기. 15 아님 20 아님 25
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
			
			//데이터 몇백개 넣고 페이징 처리 확인 해봐야함. count 다른거 쓰는거 있었어서 수정. 이런거는 데이터 많이 들어가기 전에는 티안남...조심
			Map<String, Object> getTotal = Map.of("recipient", recipient, "sender", sender);
		    int total = msgMapper.getBinCount(getTotal);

		    int display = 10;		 // 화면 봐가면서 몇개가 적당할지 찾기. 15 아님 20 아님 25
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
	
}























