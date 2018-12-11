package com.taxi.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.taxi.driver.dao.DriverDao;
import com.taxi.driver.dto.DriverDto;
import com.taxi.rating.dto.RatingDto;
import com.taxi.schedule.dao.ScheduleDao;
import com.taxi.schedule.dto.ScheduleDto;
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
		ScheduleDao scheduleDao = new ScheduleDao();
		HttpSession session = request.getSession();
		
		// 1. 지도에서 경로설정
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
		
		// 2. 일정 설정
		else if(command.equals("schedule")) {
			String course =  request.getParameter("course");
			String lat =  request.getParameter("lat");
			String lng =  request.getParameter("lng");
			String location = request.getParameter("location");
			String date = request.getParameter("date");
			String price = request.getParameter("price");
			int time = Integer.parseInt(request.getParameter("time"));
			int people = Integer.parseInt(request.getParameter("people"));
			
			ScheduleDto dto = new ScheduleDto(0,0,0,0,date,time,location,course,people,price,null,lat,lng,"");
			session.setAttribute("scheduleDto", dto);
			
			List<DriverDto> list = driverDao.DriverList();
			for(int i = 0; i<list.size(); i++) {
				System.out.println("rating : "+ list.get(i).getRa_rating());
			}
			
			request.setAttribute("driverList", list);
			dispatch("route_driver_list.jsp", request, response);
		}
		
		// 3. 결제 정보 
		else if(command.equals("payment")){
			int d_no = Integer.parseInt(request.getParameter("id"));
			DriverDto driverDto = driverDao.selectDriver(d_no);
			session.setAttribute("driverDto", driverDto);
			response.sendRedirect("route_payment.jsp");
		}
		
		// 4. 결제 완료 및 데이터베이스 입력
		else if(command.equals("route_payment_confirmed")) {
			ScheduleDto scheduleDto = (ScheduleDto) session.getAttribute("scheduleDto");
			DriverDto driverDto = (DriverDto) session.getAttribute("driverDto");
			UserDto userDto = (UserDto) session.getAttribute("userDto");
			int u_no = userDto.getU_no();
			int d_no = driverDto.getD_no();
			scheduleDto.setU_no(u_no);
			scheduleDto.setD_no(d_no);
			
			int res = scheduleDao.insertSchedule(scheduleDto);
			System.out.println(scheduleDto);
			if(res > 0) {
				request.setAttribute("scheduleDto", scheduleDto);
				dispatch("route_payment_confirmed.jsp", request, response);
			}
		}
		
		// 5. 스케쥴에 지도 출력
		else if(command.equals("scheduleMap")) {
			ScheduleDto scheduleDto = null;
			String s_course;
			String s_latitude;
			String s_longitude;
			if(session.getAttribute("scheduleDto") != null) {
				scheduleDto = (ScheduleDto) session.getAttribute("scheduleDto");
				s_course = scheduleDto.getS_course();
				s_latitude = scheduleDto.getS_latitude();
				s_longitude = scheduleDto.getS_longitude();
			} else {
				s_course = (String)request.getParameter("s_course");
				s_latitude = (String)request.getParameter("s_latitude");
				s_longitude = (String)request.getParameter("s_longitude");
			}
			
			String s_courseArr[] = s_course.split("/");
			String s_latitudeArr[] = s_latitude.split("/");
			String s_longitudeArr[] = s_longitude.split("/");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("s_course", s_courseArr);
			map.put("s_latitude", s_latitudeArr);
			map.put("s_longitude", s_longitudeArr);
			Gson gson = new Gson();
			String json = gson.toJson(map);
			PrintWriter out = response.getWriter();
			out.println(json);
		}
		
		
		// 달력에 해당 일자 스케쥴 출력
		else if(command.equals("scheduleDetail")){
			int s_seq = Integer.parseInt(request.getParameter("s_seq"));
			ScheduleDto dto = scheduleDao.selectOne(s_seq);
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("scheduleDetail", dto);
			Gson gson = new Gson();
			String json = gson.toJson(map);
			PrintWriter out = response.getWriter();
			out.println(json);
			
		} else if(command.equals("checkConfirmed"))	{
			int s_seq = Integer.parseInt(request.getParameter("s_seq"));
			int res = scheduleDao.checkConfirmed(s_seq);
			if(res > 0) {
				PrintWriter out = response.getWriter();
				out.println("스케쥴이 확정되었습니다.");
			}
		} else if(command.equals("rejected"))	{
			int s_seq = Integer.parseInt(request.getParameter("s_seq"));
			int res = scheduleDao.checkRejected(s_seq);
			if(res > 0) {
				PrintWriter out = response.getWriter();
				out.println("스케쥴을 거절하였습니다.");
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
