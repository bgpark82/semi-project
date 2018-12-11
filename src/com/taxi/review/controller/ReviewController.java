package com.taxi.review.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.taxi.driver.dao.DriverDao;
import com.taxi.schedule.dao.ScheduleDao;
import com.taxi.schedule.dto.ScheduleDto;



@WebServlet("/ReviewController")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
    public ReviewController() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = (String)request.getParameter("command");
		ScheduleDao scheduleDao = new ScheduleDao();
		DriverDao driverDao = new DriverDao();
		
		if(command.equals("review")) {
			int u_no = Integer.parseInt(request.getParameter("u_no"));
			List<ScheduleDto> scheduleList = scheduleDao.showAllSchedule(u_no);
			
			System.out.println("list : " + scheduleList);
			request.setAttribute("list", scheduleList);
			dispatch("taxi_review.jsp", request, response);
		}
		else if(command.equals("selectOne")) {
			int s_seq = Integer.parseInt(request.getParameter("s_seq"));
			ScheduleDto scheduleDto = scheduleDao.selectOne(s_seq);

			request.setAttribute("dto", scheduleDto);
			dispatch("taxi_review_one.jsp", request, response);
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
