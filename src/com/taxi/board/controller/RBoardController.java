package com.taxi.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.taxi.board.dao.RBoardDao;
import com.taxi.board.dto.RBoardDto;


@WebServlet("/RBoardController")
public class RBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RBoardController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		RBoardDao dao = new RBoardDao();
		
		if(command.equals("boardlist")) {
			List<RBoardDto> list = dao.selectAll();
			request.setAttribute("list", list);
			dispatch("rboard_list.jsp", request, response);
	
		} else if(command.equals("selectone")) {
			int r_no = Integer.parseInt(request.getParameter("r_no"));
			int r_count = Integer.parseInt(request.getParameter("r_count"));
			RBoardDto dtoc = new RBoardDto();
			dtoc.setR_no(r_no);
			dtoc.setR_count(r_count);
			dao.updateCount(dtoc);
			RBoardDto dto = dao.selectOne(r_no);
			request.setAttribute("dto", dto);
			dispatch("rboard_detail.jsp", request, response);
		
		} else if(command.equals("writeform")) {
			response.sendRedirect("rboard_write.jsp");
			
		} else if(command.equals("boardwrite")) {
			String r_writer = request.getParameter("r_writer");
			String r_title = request.getParameter("r_title");
			String r_content = request.getParameter("r_content");
			String r_area = request.getParameter("r_area");
			
			RBoardDto dto = new RBoardDto();
			dto.setR_writer(r_writer);
			dto.setR_title(r_title);
			dto.setR_content(r_content);
			dto.setR_area(r_area);
			
			int res = dao.insert(dto);
			
			if(res > 0) {
				jsResponse("작성 성공", "RBoardController?command=boardlist", response);
			} else {
				jsResponse("작성 실패", "RBoardController?command=writeform", response);
			}
			
			
		} else if(command.equals("updateform")) {
			int r_no = Integer.parseInt(request.getParameter("r_no"));
			RBoardDto dto = dao.selectOne(r_no);
			request.setAttribute("dto", dto);
			dispatch("rboard_update.jsp", request, response);
			
		} else if(command.equals("update")) {
			int r_no = Integer.parseInt(request.getParameter("r_no"));
			String r_title = request.getParameter("r_title");
			String r_content = request.getParameter("r_content");
			String r_area = request.getParameter("r_area");
			
			RBoardDto dto = new RBoardDto();
			dto.setR_no(r_no);
			dto.setR_title(r_title);
			dto.setR_content(r_content);
			dto.setR_area(r_area);
			
			int res = dao.update(dto);
			
			if(res > 0) {
				jsResponse("수정 성공", "RBoardController?command=selectone&r_no="+r_no, response);
			} else {
				jsResponse("수정 실패", "RBoardController?command=updateform&r_no="+r_no, response);
			}
			
		} else if(command.equals("delete")) {
			int r_no = Integer.parseInt(request.getParameter("r_no"));
			int res = dao.delete(r_no);
			
			if(res > 0) {
				jsResponse("삭제 성공", "RBoardController?command=boardlist", response);
			} else {
				jsResponse("삭제 실패", "RBoardController?command=selectone&r_no="+r_no, response);
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
