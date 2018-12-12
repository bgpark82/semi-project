package com.taxi.like.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.taxi.board.dao.RBoardDao;
import com.taxi.board.dto.RBoardDto;
import com.taxi.like.dao.likeDao;
import com.taxi.like.dto.likeDto;
import com.taxi.user.dto.UserDto;


@WebServlet("/LikeController")
public class LikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//HttpSession session = null;
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		//UserDto dto = (UserDto)session.getAttribute("dto");
		int u_no = Integer.parseInt(request.getParameter("u_no"));
		JSONObject obj = new JSONObject();
		RBoardDao daor = new RBoardDao();
		likeDao daol = new likeDao();
		System.out.println("please!!! r_no"+r_no);
		ArrayList<String> msgs = new ArrayList<String>();
		
		RBoardDto dtor = daor.selectOne(r_no);
		int r_recommend = dtor.getR_recommend();	//게시글의 추천수

		if(daol.confirmLike(r_no, u_no) == 0) {		//DB에 저장 된 정보가 있는지 확
			daol.insertLike(r_no, u_no);			//없다면 초기값 세팅
		}
		
		likeDto dtol = daol.selectOne(r_no, u_no);
		int like_check = dtol.getLike_check();		//해당 유저의 좋아요 체크(1 또는 0)
		
		
		if(like_check == 0) {
			msgs.add("좋아요!");
			daol.addLike(r_no, u_no);	//like 테이블의 like_check 값을 1로 변경
			like_check++;
			daor.plusLike(r_no);	//rboard 테이블의 추천수 증가
			r_recommend++;
		}else {
			msgs.add("좋아요 취소");
			daol.cancelLike(r_no, u_no);
			like_check--;
			daor.minusLike(r_no);
			r_recommend--;
		}
		
		obj.put("r_no", r_no);
		obj.put("like_check", like_check);
		obj.put("r_recommend", r_recommend);
		obj.put("msg", msgs);
		
		PrintWriter out = response.getWriter();
		out.println(obj.toJSONString());
		
		System.out.println("sevlet에서 보내는 데이터 : "+obj.toJSONString());
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
