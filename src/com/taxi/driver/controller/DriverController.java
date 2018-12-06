package com.taxi.driver.controller;

import java.io.File;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.taxi.driver.dao.DriverDao;
import com.taxi.driver.dto.DriverDto;




@WebServlet("/DriverController")
public class DriverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DriverController() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MultipartRequest multi = null;
		int fileMaxSize = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload").replaceAll("\\\\", "/");
		System.out.println("savePath : " +savePath);
		DefaultFileRenamePolicy dr = new DefaultFileRenamePolicy();
		try {
			multi  = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", dr); //DefaultFileRenamePolicy: 파일이름이 겹치는 등의 오류를 처리해줌
			System.out.println("multi : " +multi);
		} catch(Exception e) {
			System.out.println("오류");
			response.sendRedirect("driver_registform.jsp");
			return;
		}
		String d_ID = multi.getParameter("d_id");
		
		System.out.println("드라이버id"+d_ID);
		
		String fileName = "";
		File file = multi.getFile("driverProfile"); //getFile : 파일의 경로
		
		
		
		
		
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
		} else if(command.equals("registdriver")) {
			String d_name = request.getParameter("d_name");
			String d_id = request.getParameter("d_id");
			String d_pw = request.getParameter("d_pw");
			String d_birth = request.getParameter("d_birth");
			String d_gender = request.getParameter("d_gender");
			String d_phone = request.getParameter("d_phone");
			String d_email = request.getParameter("d_email");
			String d_license = request.getParameter("d_license");
			String d_carnum = request.getParameter("d_carnum");
			String d_role = request.getParameter("d_role");
			
			
			
			
			
			
			// file upload
			
			
			
			
			// db
//			String d_ID = multi.getParameter("d_id");
//			
//			System.out.println("드라이버id"+d_ID);
//			
//			String fileName = "";
//			File file = multi.getFile("driverProfile"); //getFile : 파일의 경로

			if(file != null) {
				String ext = file.getName().substring(file.getName().lastIndexOf(".") + 1); //lastIndexOf : 오른쪽에서 부터 문자를 찾아 인덱스를 리턴해줌
				System.out.println(ext);
				
				if(ext.equals("jpg") || ext.equals("png") || ext.equals("gif")) {
					String prev = new DriverDao().getUser(d_ID).getD_profile();
					
					System.out.println("prev : "+ prev);
					
					File prevFile = new File(savePath + "/" + prev);
					if(prevFile.exists()) {
						prevFile.delete();
					}
					fileName = file.getName();
					System.out.println("ddd : "+fileName);
				}else {
					if(file.exists()) {
						file.delete();
					}
					System.out.println("d_id : "+d_ID+"filename : " + fileName);
					//session.setAttribute("messageType", "오류 메시지");
					//session.setAttribute("messageContent", "이미지 파일만 업로드 가능합니다.");
					System.out.println("오류3");
					response.sendRedirect("driver_profileupdate.jsp");
					return;
				}
			}
			
			new DriverDao().profile(d_ID, fileName);
			DriverDto dto = new DriverDao().getUser(d_ID);
			request.setAttribute("dto", dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("driver_info.jsp");
			dispatch.forward(request, response);
			
			
	
			
			
			
			
			
			
			DriverDto driverDto = new DriverDto();
			
			dto.setD_name(d_name);
			dto.setD_id(d_id);
			dto.setD_pw(d_pw);
			dto.setD_birth(d_birth);
			dto.setD_gender(d_gender);
			dto.setD_phone(d_phone);
			dto.setD_email(d_email);
			dto.setD_license(d_license);
			dto.setD_carnum(d_carnum);
			dto.setD_role(d_role);
			
			int res = dao.insertDriver(driverDto);
			
			if(res > 0) {
				session.setAttribute("dto", dto);
				jsResponse("회원가입 성공", "index.jsp", response);
			} else {
				jsResponse("회원가입 실패", "driver_registform.jsp", response);
			}
	
			
		//로그인	
		} else if(command.equals("login")) {
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
			request.setAttribute("dto", dto);
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
		
		doGet(request, response);
	}

}
