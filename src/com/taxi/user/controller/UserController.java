package com.taxi.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.taxi.user.dao.UserDao;
import com.taxi.user.dto.UserDto;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
     
    public UserController() {
       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		
		UserDao dao = new UserDao();
		
		//로그인
		if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			UserDto dto = dao.login(id, pw);
			
			if(dto != null) {
				session.setAttribute("userDto", dto);
				session.setMaxInactiveInterval(60*60);
			
				jsResponse("로그인 성공","index.jsp", response);
				
			} else {
				jsResponse("아이디 혹은 비밀번호를 확인해주세요","index.jsp", response);
			}
			
		} else if(command.equals("registform")) {
			response.sendRedirect("user_registform.jsp");
			
		// 회원가입	
		} else if(command.equals("regist")) {
			String u_id = request.getParameter("u_id");
			String u_pw = request.getParameter("u_pw");
			String u_name = request.getParameter("u_name");
			String u_birth = request.getParameter("u_birth");
			String u_gender = request.getParameter("u_gender");
			String u_phone = request.getParameter("u_phone");
			String u_email = request.getParameter("u_email");
			
			UserDto dto = new UserDto();
			dto.setU_id(u_id);
			dto.setU_pw(u_pw);
			dto.setU_name(u_name);
			dto.setU_birth(u_birth);
			dto.setU_gender(u_gender);
			dto.setU_phone(u_phone);
			dto.setU_email(u_email);
			
			int res = dao.insertUser(dto);
			
			if(res > 0) {
				jsResponse("회원가입 성공", "index.jsp", response);
			} else {
				jsResponse("회원가입 실패", "user_registform.jsp", response);
			}
			
		// 아이디 중복체크	
		} else if(command.equals("idchk")) {
			String u_id = request.getParameter("id");
			String res = dao.idChk(u_id);
			boolean idnotused = true;
			
			if(res != null) {
				idnotused = false;
			}
			response.sendRedirect("user_idchk.jsp?idnotused="+idnotused);
			
		// 마이페이지
		} else if(command.equals("userinfo")) {
			int u_no = Integer.parseInt(request.getParameter("u_no"));
			UserDto dto = dao.userInfo(u_no);
			request.setAttribute("dto", dto);
			dispatch("user_info.jsp", request, response);
		
		// 회원정보 수정
		} else if(command.equals("userupdate")) {
			int u_no = Integer.parseInt(request.getParameter("u_no"));
			String u_pw = request.getParameter("pw1");
			String u_email = request.getParameter("u_email");
			String u_phone = request.getParameter("u_phone");
			
			UserDto dto = new UserDto();
			dto.setU_no(u_no);
			dto.setU_pw(u_pw);
			dto.setU_email(u_email);
			dto.setU_phone(u_phone);
			int res = dao.updateUser(dto);
			if(res > 0) {
				response.sendRedirect("index.jsp");
			} else {
				jsResponse("수정 실패", "UserController?command=userinfo", response);
			}
		
		// 회원탈퇴
		} else if(command.equals("userout")) {
			int u_no = Integer.parseInt(request.getParameter("u_no"));
			int res = dao.userOut(u_no);
			
			if(res > 0) {
				jsResponse("탈퇴 완료", "index.jsp", response);
			} else {
				jsResponse("탈퇴 실패", "index.jsp", response);
			}
			
		}
		
	}

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'> alert('"+msg+"'); location.href='"+url+"'; </script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
