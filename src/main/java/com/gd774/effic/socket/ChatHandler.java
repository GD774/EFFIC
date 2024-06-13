package com.gd774.effic.socket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;


@Component
@Slf4j
public class ChatHandler extends TextWebSocketHandler {
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

        System.out.println("누군가 접속");
		list.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//String uMsg = message.getPayload();
		
		String originalPayload = message.getPayload(); // 원본 메시지 페이로드 가져오기
	    String modifiedPayload = originalPayload + "헤헤"; // 접미사 추가

	    TextMessage modifiedMessage = new TextMessage(modifiedPayload);
		
		for (WebSocketSession webSocketSession : list) {
			webSocketSession.sendMessage(modifiedMessage);
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("누군가 떠남");
		list.remove(session);
	}
}
