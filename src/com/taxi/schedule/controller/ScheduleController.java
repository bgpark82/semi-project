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
//			JsonParser parser = new JsonParser();
//			JsonElement tradeElement = parser.parse(list);
//			JsonArray arr = tradeElement.getAsJsonArray();
//			List<String> course = new ArrayList<String>();
//			for(int i = 0; i < arr.size(); i++) {
//				course.add(arr.get(i).toString().substring(1, arr.get(i).toString().length()-1));
//			}
			
			ScheduleDto dto = new ScheduleDto(0,null,0,location,course,0,"",null,lat,lng);
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
			
			Date regdate = new Date();
			Date regdateRes = null;
			SimpleDateFormat regdateformat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
			try {regdateRes = regdateformat.parse(regdateformat.format(regdate));} 
			catch (ParseException e1) {e1.printStackTrace();}
			
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-mm-dd");
			Date dateRes =null;
			try {dateRes = dateformat.parse(date);
			} catch (ParseException e) {e.printStackTrace();}
			
			ScheduleDto dto = new ScheduleDto(0,dateRes,time,location,course,people,price,regdateRes,lat,lng);
			
			session.setAttribute("scheduleDto", dto);
			
			List<DriverDto> list = driverDao.DriverList();
			request.setAttribute("list", list);
			dispatch("route_driver_list.jsp", request, response);
		}
		else if(command.equals("payment")){
			int d_no = Integer.parseInt(request.getParameter("id"));
			DriverDto driverDto = driverDao.selectDriver(d_no);
			session.setAttribute("driverDto", driverDto);
			dispatch("route_payment.jsp", request, response);
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
