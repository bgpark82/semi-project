<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
	<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판_리뷰상세보기</title>
<!-- 뷰포트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="form/header.jsp" %>
	<div class="container" >
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				<b>리뷰 상세 보기</b><small> 사람들의 후기를 읽어보아요!</small>
			</h1>
		</div>
	</div>
	<div class="row">
	<table class="table" style="text-align:center; border:1px solid #dddddd">
	<thead>
		<tr>
			<th colspan="3" style="background-color:#eeeeee; text-align:center;">리뷰게시판 글보기</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>작성자</th>
			<td>${dto.r_writer }</td>
		</tr>
		<tr>
			<th>여행지역</th>
			<td>${dto.r_area }</td>
		</tr>
		<tr>
			<th>제	목</th>
			<td>${dto.r_title }</td>
		</tr>
		<tr>
			<th>내	용</th>
			<td style="text-align:left;">${dto.r_content }</td>
		</tr>
		</tbody>
		</table>
		</div>
		<hr>
			<input type="button" class="btn btn-default pull-right" value="목록" onclick="location.href='RBoardController?command=boardlist&u_no=${userDto.u_no}'"/>
			<input type="button" class="btn btn-default pull-right" value="삭제" onclick="location.href='RBoardController?command=delete&r_no=${dto.r_no}&u_no=${userDto.u_no}'"/>
			<input type="button" class="btn btn-default pull-right" value="수정" onclick="location.href='RBoardController?command=updateform&r_no=${dto.r_no}'"/>
		</div>	
<%@ include file="form/footer.jsp" %>
</body>
</html>