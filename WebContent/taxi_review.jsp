<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.List" %>
<%@ page import="com.taxi.schedule.dto.ScheduleDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
#map {
	height: 400px;
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="form/header.jsp"%>
	
	<%
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date cTime = new Date();
		String currentDate = format.format ( cTime );
		
		List<ScheduleDto> list = (List<ScheduleDto>) request.getAttribute("list"); 
	%>

	<br><h1 style="text-align:center">즐거운 여행되셨나요? <small>여행을 함께한 기사님의 평점과 리뷰를 작성해주세요</small></h1><hr>
						
	<div class="container" style="width:1000px; margin: 0 auto;">
		<div class="row">
			
		</div>
		<div class="container" style="width:800px; margin: 0 auto;">
		<table class="table">
			
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="250">
				<col width="50">
				<col width="100">
				
				<tr>
					<th>날짜</th><th>기사님</th><th>시간</th><th>지역</th><th>경로</th><th>인원</th><th>신청일</th>
				</tr>
				<%
					for(int i = 0; i < list.size(); i++){
						long pastTime = format.parse(list.get(i).getS_date()).getTime();
						long currentTime = format.parse(currentDate).getTime();
						if(pastTime < currentTime){
					
				%>
					
						<tr>
							<td><%= list.get(i).getS_date() %></td> 
							<td><a href="ReviewController?command=selectOne&s_seq=<%= list.get(i).getS_seq() %>"><%= list.get(i).getD_name() %></a></td>
							<td><%= list.get(i).getS_time() %>시</td>
							<td><%= list.get(i).getS_location() %></td>
							<td><%= list.get(i).getS_course() %></td>
							<td><%= list.get(i).getS_people() %></td>
							<td><%= list.get(i).getS_regdate() %></td>
						</tr>
				
				<%
						}
					}
				%>
			</table>
		<input style="float:right" type="button" value="홈으로 가기" onclick="location.href='index.jsp'" class="btn btn-default" style="float: right;">

			</div>
			</div>

	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDogTL8Fk8vbPq2JCZrZKedH35rNtSGKJE&libraries=places"></script>
	<script type="text/javascript" src="js/schedule_review.js"></script>		

			<%@ include file="form/footer.jsp"%>
</body>
</html>