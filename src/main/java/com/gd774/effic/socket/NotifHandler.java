package com.gd774.effic.socket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.gd774.effic.dto.UserDto;
import com.gd774.effic.service.MsgService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Component
@Slf4j
public class NotifHandler extends TextWebSocketHandler {
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	private final MsgService msgService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		list.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//String uMsg = message.getPayload();
		
		String originalPayload = message.getPayload(); // 원본 메시지 페이로드 가져오기
	    String payload = originalPayload; 
	    
	    String[] recipients = null;
	    
	    if (payload != null && !payload.isEmpty()) {
		    recipients = payload.replaceAll(" ", "").split(",");
		}
	    
	    
	    for (String recipient : recipients) {
	    	
	    	
	    	String count = msgService.getUnReadCount(recipient) + ""; 
	    	
	    	TextMessage modifiedMessage = new TextMessage(count);
	    	
	    	for (WebSocketSession webSocketSession : list) {
	    		UserDto user = (UserDto) webSocketSession.getAttributes().get("user");

	    		if(user.getEmpId().equals(recipient)) {
	    			webSocketSession.sendMessage(modifiedMessage);

	    		}
	    }
		}
		

			
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
	}
}
