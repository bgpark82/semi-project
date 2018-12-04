package com.taxi.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;


@ServerEndpoint(value="/websocketendpoint", configurator=ChatroomServerConfigurator.class)
public class ServerEndPoint {
	static Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(EndpointConfig endpointConfig, Session userSession) {
		chatroomUsers.add(userSession);
	}
	@OnMessage
	public void onMessage(String message, Session userSession) throws IOException {
		String username = (String)userSession.getUserProperties().get("username");
		Iterator<Session> iterator = chatroomUsers.iterator();
		while(iterator.hasNext())
			iterator.next().getBasicRemote().sendText(buildJsonData(username, message));
	}
	@OnClose
	public void onClose(Session userSession) {
		chatroomUsers.remove(userSession);
	}
	@OnError
	public void onError(Throwable t) {
		
	}
	
	private String buildJsonData(String username, String message) {
		JSONObject json = new JSONObject();
		json.put("message", username+":"+message);
		return json.toString();
		  
	}
}
