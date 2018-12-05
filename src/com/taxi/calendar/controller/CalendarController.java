package com.taxi.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.taxi.calendar.dao.CalendarDao;
import com.taxi.calendar.dao.Util;
import com.taxi.calendar.dto.CalendarDto;


@WebServlet("/CalendarController")
public class CalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CalendarController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		CalendarDao dao = new CalendarDao();
		
		System.out.println("command : " + command);
		
		//Ķ���� ���� 
		if(command.equals("calendar")) {
			response.sendRedirect("UserCalendar.jsp");
			
		//Ķ���� ������ 1.0ver	()
		}else if(command.equals("caldetail")){
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");
			int cal_no = Integer.parseInt(request.getParameter("cal_no"));
			
			String yyyyMMdd = year= Util.isTwo(month)+Util.isTwo(date);
			
			HttpSession session = request.getSession();
			session.setAttribute("ymd", yyyyMMdd);
			
			List<CalendarDto> list = dao.UserCalDetail("kh", cal_no);
			request.setAttribute("list", list);
			dispatch("UserCalenar.jsp", request, response);
			
		
			
			
		//ajax Ķ���� ������  
		}else if (command.equals("ajaxboard")) {
			
			//�Ѿ�� ���� �޴´�. 
			int cal_no = Integer.parseInt(request.getParameter("cal_no"));
			String cal_id = request.getParameter("cal_id");
			String cal_title = request.getParameter("cal-title");
			String cal_content = request.getParameter("cal-content");
			String cal_mdate = request.getParameter("cal_mdate");
			//ate regdate = request.getParameter("regdate");			
			
			CalendarDto dto = new CalendarDto();
			dto.setCal_no(cal_no);
			dto.setCal_id(cal_id);
			dto.setCal_title(cal_title);
			dto.setCal_content(cal_content);
			dto.setCal_mdate(cal_mdate);
			//dto.setRegdate(regdate);
			
			
			//JSON ��ü �����
			JSONObject obj = new JSONObject();
			
			//�ٽ� ajax�� �����ֱ�
			PrintWriter out = response.getWriter();
			out.println(obj.toJSONString());
			
			System.out.println("�������� �������� ������ Ȯ���ϱ�" + obj.toJSONString());
			
			
		}
		
		
		
	
		
		
	/*	//Ķ���� ������
		else if(command.equals("caldetail")) {
			int cal_no = Integer.parseInt(request.getParameter("cal_no"));
			UserCalDto dto = dao.UserCalDetail(cal_no);
			request.setAttribute("dto", dto);
			
			dispatch("UserCalendar.jsp", request, response);
			
		}*/
	}

	
	

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
