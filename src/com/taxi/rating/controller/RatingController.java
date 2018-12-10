package com.taxi.rating.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.taxi.rating.dao.RatingDao;
import com.taxi.rating.dto.RatingDto;
import com.taxi.schedule.dao.ScheduleDao;
import com.taxi.schedule.dto.ScheduleDto;


@WebServlet("/RatingController")
public class RatingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RatingController() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = (String)request.getParameter("command");
		RatingDto ratingDto = new RatingDto();
		RatingDao ratingDao = new RatingDao();
		ScheduleDao scheduleDao = new ScheduleDao();
		
		if(command.equals("rating")) {
			int ra_rating = Integer.parseInt(request.getParameter("ra_rating"));
			int u_no = Integer.parseInt(request.getParameter("u_no"));
			int d_no = Integer.parseInt(request.getParameter("d_no"));
			int s_seq = Integer.parseInt(request.getParameter("s_seq"));
			
			int res = ratingDao.insertRating(ra_rating, d_no, u_no);
			
			if(res > 0) {
				ScheduleDto scheduleDto = scheduleDao.selectOne(s_seq);
				request.setAttribute("res", res);
				request.setAttribute("dto", scheduleDto);
				dispatch("taxi_review_one.jsp", request, response);
			} else {
				jsResponse("평점을 남기는데 실패하였습니다.", "history.back()", response);
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'> alert('"+msg+"'); location.href='"+url+"'; </script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
