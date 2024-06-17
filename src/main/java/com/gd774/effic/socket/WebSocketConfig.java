package com.gd774.effic.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;


@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
   
   @Autowired
   private final NotifHandler chatHandler;
   
   public WebSocketConfig(NotifHandler chatHandler) {
	   this.chatHandler = chatHandler;
   }
   
   @Override
   public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
      registry.addHandler(chatHandler, "/msg").setAllowedOrigins("*")
      .addInterceptors(new HttpSessionHandshakeInterceptor());
   }
   
}
