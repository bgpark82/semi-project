package com.taxi.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.taxi.schedule.dao.ScheduleDao;


@WebServlet("/ScheduleController")
public class ScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScheduleController() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = (String) request.getParameter("command");
		ScheduleDao dao = new ScheduleDao();
		
		if(command.equals("route")) {
			String list =  request.getParameter("list");
			String location = request.getParameter("location");
			
			System.out.println("list : " + list);
			JsonParser parser = new JsonParser();
			JsonElement tradeElement = parser.parse(list);
			JsonArray arr = tradeElement.getAsJsonArray();
			List<String> arrayList = new ArrayList<String>();
			
			for(int i = 0; i < arr.size(); i++) {
				arrayList.add(arr.get(i).toString().substring(1, arr.get(i).toString().length()-1));
			}
			
			request.setAttribute("location", location);
			request.setAttribute("list", arrayList);
			dispatch("route_schedule.jsp", request, response);
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
