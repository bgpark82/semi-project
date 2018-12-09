package com.taxi.driver.controller;

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

import com.taxi.driver.dao.DriverDao;
import com.taxi.driver.dto.DriverDto;
import com.taxi.schedule.dto.ScheduleDto;




@WebServlet("/DriverController")
public class DriverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DriverController() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		DriverDao dao = new DriverDao();
		
		//회원가입 폼
		if(command.equals("registform")) {
			response.sendRedirect("driver_registform.jsp");
			
		//아이디 중복체크	
		} else if(command.equals("idchk")) {
			
			String d_id = request.getParameter("id");
			String res = dao.idChk(d_id);
			
			boolean idnotused = true;
			
			if(res != null) {
				idnotused = false;				
			}
			response.sendRedirect("driver_idchk.jsp?idnotused=" + idnotused);

			
		// 회원가입
		}  else if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			DriverDto dto = dao.login(id, pw);
			
			if(dto.getD_id().equals(id)) {
				session.setAttribute("driverDto", dto);
				session.setMaxInactiveInterval(60*60);
				jsResponse("로그인 성공", "index.jsp", response);
			} else {
				jsResponse("로그인 실패", "taxi_login.jsp", response);	
			}
		
		//로그아웃
		} else if(command.equals("logout")) {
			session.invalidate();
			jsResponse("로그아웃 하셨습니다","index.jsp", response);
		
		//마이페이지	
		} else if(command.equals("driverinfo")) {
			int d_no = Integer.parseInt(request.getParameter("d_no"));
			DriverDto dto = dao.selectDriver(d_no);
			
			List<ScheduleDto> scheduleDto = dao.showRequest(d_no);
			System.out.println(scheduleDto);
			request.setAttribute("dto", dto);
			System.out.println("profile check : " + dto.getD_profile());
			dispatch("driver_info.jsp", request, response);
			
		
		//회원탈퇴	
		} else if(command.equals("driverdelete")) {
			int d_no = Integer.parseInt(request.getParameter("d_no"));
			
			int res = dao.deleteDriver(d_no);
			
			session.setAttribute("dto", res);
			
			if(res > 0) {
			jsResponse("회원탈퇴성공", "index.jsp", response);
		
			} else {
		
			jsResponse("회원탈퇴실패", "driver_info.jsp", response);
		
			} 
			
		//회원정보수정
		} else if(command.equals("driverupdateform")) {
			
			int d_no = Integer.parseInt(request.getParameter("d_no"));
			
			DriverDto dto = dao.selectDriver(d_no);
			
			request.setAttribute("dto", dto);
			
			dispatch("driver_updateform.jsp", request, response);
			
		//회원정보 수정 완료	
		} else if(command.equals("driverupdate")) {
			
			int d_no = Integer.parseInt(request.getParameter("d_no"));
			
			String d_pw =request.getParameter("d_pw");
			String d_phone =request.getParameter("d_phone");
			String d_email =request.getParameter("d_email");
			String d_carnum =request.getParameter("d_carnum");
			String d_license =request.getParameter("d_license");
			
			
			DriverDto dto = new DriverDto();
			
			dto.setD_no(d_no);
			dto.setD_pw(d_pw);
			dto.setD_phone(d_phone);
			dto.setD_email(d_email);
			dto.setD_carnum(d_carnum);
			dto.setD_license(d_license);
			
			
			int res = dao.updateDriver(dto);
			
			if(res > 0) {
				request.setAttribute("dto", dto);
				jsResponse("글 수정 성공", "DriverController?command=driverinfo&d_no=" + d_no, response);
				
			} else {
				dispatch("driver_main.jsp", request, response);
			}
			
			
	
		//운전자 리스트	
		} else if(command.equals("driverlist")) {
			List<DriverDto> list = dao.DriverList();
			request.setAttribute("list", list);
			dispatch("driver_list.jsp", request, response);
		} else {
			jsResponse("리스트 수정 실패", "driver_info.jsp", response);
		}
}
	
	
		private void jsResponse(String msg, String url, HttpServletResponse response) 
				throws IOException {
					String s = "<script type='text/javascript'> alert('" + msg + "'); location.href='"
					 + url + "'; </script>";
					PrintWriter out = response.getWriter();
					out.print(s);
	
				}
	
		private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {
					RequestDispatcher dispatch = request.getRequestDispatcher(url);
					dispatch.forward(request, response);
	
				}
		
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		doGet(request, response);
	}

}
