<%@page import="com.taxi.driver.dto.DriverDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>			 
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<%@ include file="form/header.jsp" %>
	<h1>메인화면</h1>
		<div>
			<span>${dto.d_name }님 환영합니다.(등급: ${dto.d_role })</span>
			<a href="DriverController?command=logout">로그아웃</a>
		</div>
		<div>
			<div>
				<a href="DriverController?command=driverinfo&d_no=${dto.d_no }">마이페이지</a>
			</div>
		</div>
<%@ include file="form/footer.jsp" %>


</body>
</html>