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
         int u_no = Integer.parseInt(request.getParameter("u_no"));
         List<RBoardDto> list = dao.selectAll();
         request.setAttribute("list", list);
         dispatch("rboard_list.jsp?u_no="+u_no, request, response);
   
      } else if(command.equals("rboard_search")) {
         int u_no = Integer.parseInt(request.getParameter("u_no"));
         String condition = request.getParameter("condition");
         System.out.println("검색조건 : "+condition+", u_no 값 :"+u_no);
         //String word = request.getParameter("word");
         if(condition.equals("all")) {
            List<RBoardDto> list_all = dao.selectAll();
            request.setAttribute("list", list_all);
         } else if(condition.equals("hit")) {
            List<RBoardDto> list_hit = dao.selectAll_hit();
            System.out.println("syso값 :"+list_hit);
            request.setAttribute("list", list_hit);
         } else if(condition.equals("recommend")) {
            List<RBoardDto> list_recommend = dao.selectAll_recommend();
            request.setAttribute("list", list_recommend);
         }
         dispatch("rboard_list.jsp?u_no="+u_no,request,response);
         
      }   else if(command.equals("selectone")) {
         int r_no = Integer.parseInt(request.getParameter("r_no"));
         String u_id = request.getParameter("u_id"); //id값을 가져와서 조회수 수정??(미완성)
         
         
         //조회수 증가
         dao.updateHit(r_no);
         
         RBoardDto dto = dao.selectOne(r_no);
         request.setAttribute("dto", dto);
         dispatch("rboard_detail.jsp", request, response);
      
      } else if(command.equals("writeform")) {
         String u_id = request.getParameter("u_id");
         response.sendRedirect("rboard_write.jsp?u_id="+u_id);
         
      } else if(command.equals("boardwrite")) {
         String r_writer = request.getParameter("r_writer");
         String r_title = request.getParameter("r_title");
         String r_content = request.getParameter("r_content");
         String r_area = request.getParameter("r_area");
         int u_no = Integer.parseInt(request.getParameter("u_no"));
         
         RBoardDto dto = new RBoardDto();
         dto.setR_writer(r_writer);
         dto.setR_title(r_title);
         dto.setR_content(r_content);
         dto.setR_area(r_area);
         
         int res = dao.insert(dto);
         
         if(res > 0) {
            jsResponse("작성 성공", "RBoardController?command=boardlist&u_no="+u_no, response);
         } else {
            jsResponse("작성 실패", "RBoardController?command=writeform&u_id="+r_writer, response);
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
         int u_no = Integer.parseInt(request.getParameter("u_no"));
         
         System.out.println("r_no = " +r_no);
         
         int res = dao.delete(r_no);
         System.out.println("res = "+res);
         if(res > 0) {
            jsResponse("삭제 성공", "RBoardController?command=boardlist&u_no="+u_no, response);
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