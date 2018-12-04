package com.taxi.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ChatServlet() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;char=UTF-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String username = (String)request.getParameter("username");
		session.setAttribute("username", username);
		
		
	
		if(username != null) {
			out.println("<html>");
			out.println("<head><title>Test</title></head>");
			out.println("<body>");
			out.println("username:"+username+"<br>");
			out.println("<textarea id=\"messageTextArea\" type=\"text\" readonly=\"readonly\" rows=\"10\" cols=\"45\"></textarea>");
			out.println("<input type=\"text\" id=\"messageText\" size=\"50\">");
			out.println("<input type=\"button\" value=\"Send\" onclick=\"sendMessage();\">");
			
			out.println("<script>");
			out.println("var webSocket = new WebSocket(\"ws://localhost:8787/SemiProject/websocketendpoint\");");
			out.println("var messageText = document.getElementById(\"messageText\")");
			out.println("var messageTextArea =  document.getElementById(\"messageTextArea\");");
			out.println("webSocket.onopen = function(message){onOpen(message);};");
			out.println("webSocket.onclose = function(message){onClose(message);};");
			out.println("webSocket.onmessage = function(message){onMessage(message);};");
			out.println("webSocket.onerror = function(message){onError(message);};");
			
			out.println("function sendMessage(){");
			out.println("webSocket.send(messageText.value);");
			out.println("messageText.value=\"\";};");
			
			out.println("function onMessage(message){");
			out.println("var jsonData = JSON.parse(message.data);");
			out.println("if(jsonData.message != null){");
			out.println("messageTextArea.value += jsonData.message+\"\\n\";}};");
			
			out.println("function onOpen(message){messageTextArea.value += \"Connected...\\n\";};");
			out.println("function onClose(message){messageTextArea.value += \"Disconnect... \\n\";};");
			out.println("function onError(message){echoText.value += \"Error.. \\n\";};");
			out.println("</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
