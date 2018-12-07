package com.taxi.driver.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

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


@WebServlet("/DriverRegistController")
public class DriverRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DriverRegistController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		DriverDao dao = new DriverDao();
		HttpSession session = request.getSession();
		
		// file upload
		MultipartRequest multi = null;
		int fileMaxSize = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload").replaceAll("\\\\", "/");
		System.out.println("savePath : " +savePath);					// /Users/byeonggilpark/Library/Tomcat/apache-tomcat-8.0.53/wtpwebapps/SemiProject/upload
		
		try {
			multi  = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy()); //DefaultFileRenamePolicy: 파일이름이 겹치는 등의 오류를 처리해줌
		} catch(Exception e) {
			System.out.println("오류");
			response.sendRedirect("driver_registform.jsp");
			return;
		}
		

		// db
		String d_id = multi.getParameter("d_id");
		String d_name = multi.getParameter("d_name");
		String d_region = multi.getParameter("d_region");
		String d_pw = multi.getParameter("d_pw");
		String d_birth = multi.getParameter("d_birth");
		String d_gender = multi.getParameter("d_gender");
		String d_phone = multi.getParameter("d_phone");
		String d_email = multi.getParameter("d_email");
		String d_license = multi.getParameter("d_license");
		String d_carnum = multi.getParameter("d_carnum");
		String d_role = multi.getParameter("d_role");
		
		
		String fileName = "";
		File file = multi.getFile("driverProfile"); 					// Users/byeonggilpark/Library/Tomcat/apache-tomcat-8.0.53/wtpwebapps/SemiProject/upload/1.png
		System.out.println("file : "+ file);					
		

			if(file != null) {
				String ext = file.getName().substring(file.getName().lastIndexOf(".") + 1); //lastIndexOf : 오른쪽에서 부터 문자를 찾아 인덱스를 리턴해줌
				System.out.println("ext : " + ext);
				
				if(ext.equals("jpg") || ext.equals("png") || ext.equals("gif") || ext.equals("jpeg")) {
//					String prev = new DriverDao().getUser(d_id).getD_profile();
//					
//					System.out.println("prev : "+ prev);
//					
//					File prevFile = new File(savePath + "/" + prev);
//					if(prevFile.exists()) {
//						prevFile.delete();
//					}
					fileName = file.getName();
					System.out.println("fileName : "+fileName);			// 1.png
				}else {
//					if(file.exists()) {
//						file.delete();
//					}
					System.out.println(".jpg .png .gif .jpeg 형식만 지원가능합니다");
					response.sendRedirect("driver_registform.jsp");
					return;
				}
			}
			
//			new DriverDao().profile(d_id, fileName);
//			DriverDto dto = new DriverDao().getUser(d_id);
//			request.setAttribute("dto", dto);
//			RequestDispatcher dispatch = request.getRequestDispatcher("driver_info.jsp");
//			dispatch.forward(request, response);
			
			DriverDto dto = new DriverDto();
			if(fileName.equals("")) {
				dto.setD_profile("http://localhost:8787/SemiProject/images/icon.jpg");
			} else {
				dto.setD_profile("http://localhost:8787/SemiProject/upload/"+fileName);
			}
			dto.setD_region(d_region);
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
			
			int res = dao.insertDriver(dto);
			
			if(res > 0) {
				session.setAttribute("dto", dto);
				jsResponse("회원가입 성공", "index.jsp", response);
			} else {
				jsResponse("회원가입 실패", "driver_registform.jsp", response);
			}
		
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) 
			throws IOException {
				String s = "<script type='text/javascript'> alert('" + msg + "'); location.href='"
				 + url + "'; </script>";
				PrintWriter out = response.getWriter();
				out.print(s);

			}

	

}
