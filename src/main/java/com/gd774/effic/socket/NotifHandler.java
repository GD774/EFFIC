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

        System.out.println("접속");
		list.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//String uMsg = message.getPayload();
		
		String originalPayload = message.getPayload(); // 원본 메시지 페이로드 가져오기
	    String recipient = originalPayload; 
	    System.out.println("핸들러입니다. 지금 들어온 empID는" + recipient); // 여기서 tester2 출력
	    
	    String count = msgService.getUnReadCount(recipient) + "";
	    System.out.println(count); 

	    TextMessage modifiedMessage = new TextMessage(count);
		
		for (WebSocketSession webSocketSession : list) {
			UserDto user = (UserDto) webSocketSession.getAttributes().get("user");
			System.out.println("세션 유저" + user);
			System.out.println("수신자" + recipient);
			if(user.getEmpId().equals(recipient)) {
			webSocketSession.sendMessage(modifiedMessage);
			System.out.println("웹소켓이 메세지 보냈음");
			System.out.println(modifiedMessage);
			}
		}
		

			
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("누군가 떠남");
		list.remove(session);
	}
}
