package com.taxi.schedule.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.taxi.driver.dao.DriverDao;
import com.taxi.driver.dto.DriverDto;
import com.taxi.schedule.dao.ScheduleDao;
import com.taxi.schedule.dto.ScheduleDto;
import com.taxi.user.dao.UserDao;
import com.taxi.user.dto.UserDto;


@WebServlet("/ScheduleController")
public class ScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScheduleController() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = (String) request.getParameter("command");
		DriverDao driverDao = new DriverDao();
		ScheduleDao dao = new ScheduleDao();
		HttpSession session = request.getSession();
		
		if(command.equals("route")) {
			String course =  request.getParameter("course");
			String lat =  request.getParameter("lat");
			String lng =  request.getParameter("lng");
			String location = request.getParameter("location");
			
			System.out.println("list : " + course);
			System.out.println("lat : " + lat);
			System.out.println("lng : " + lng);
			
			ScheduleDto dto = new ScheduleDto();
			dto.setS_location(location);
			dto.setS_course(course);
			dto.setS_latitude(lat);
			dto.setS_longitude(lng);
			request.setAttribute("dto", dto);
			dispatch("route_schedule.jsp", request, response);
		} 
		else if(command.equals("schedule")) {
			
			String course =  request.getParameter("course");
			String lat =  request.getParameter("lat");
			String lng =  request.getParameter("lng");
			String location = request.getParameter("location");
			String date = request.getParameter("date");
			String price = request.getParameter("price");
			int time = Integer.parseInt(request.getParameter("time"));
			int people = Integer.parseInt(request.getParameter("people"));
			
			// 현재 날짜
			Date regdate = new Date();
			Date regdateRes = null;
			SimpleDateFormat regdateformat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
			try {regdateRes = regdateformat.parse(regdateformat.format(regdate));} 
			catch (ParseException e1) {e1.printStackTrace();}
			
			// 여행 일자
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-mm-dd");
			Date dateRes =null;
			try {dateRes = dateformat.parse(date);
			} catch (ParseException e) {e.printStackTrace();}
			
			ScheduleDto dto = new ScheduleDto(0,0,0,0,dateRes,time,location,course,people,price,regdateRes,lat,lng,"");
			System.out.println(dto);
			
			session.setAttribute("scheduleDto", dto);
			
			List<DriverDto> list = driverDao.DriverList();
			request.setAttribute("driverList", list);
			dispatch("route_driver_list.jsp", request, response);
		}
		else if(command.equals("payment")){
			int d_no = Integer.parseInt(request.getParameter("id"));
			DriverDto driverDto = driverDao.selectDriver(d_no);
			session.setAttribute("driverDto", driverDto);
			response.sendRedirect("route_payment.jsp");
		}
		else if(command.equals("route_payment_confirmed")) {
			ScheduleDto scheduleDto = (ScheduleDto) session.getAttribute("scheduleDto");
			DriverDto driverDto = (DriverDto) session.getAttribute("driverDto");
			UserDto userDto = (UserDto) session.getAttribute("userDto");
			int u_no = userDto.getU_no();
			int d_no = driverDto.getD_no();
			scheduleDto.setU_no(u_no);
			scheduleDto.setD_no(d_no);
			
			int res = dao.insertSchedule(scheduleDto);
			System.out.println(scheduleDto);
			if(res > 0) {
				request.setAttribute("scheduleDto", scheduleDto);
				dispatch("route_payment_confirmed.jsp", request, response);
			}
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
