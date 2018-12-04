package com.taxi.schedule.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.*;

import com.taxi.driver.dto.DriverDto;

public class ChatroomServerConfigurator extends ServerEndpointConfig.Configurator {
	
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		
		sec.getUserProperties().put("username", (String)((HttpSession)request.getHttpSession()).getAttribute("username"));
	}
}
