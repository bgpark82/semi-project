<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<br><h1 style="text-align:center">즐거운 여행되셨나요? <small>여행을 함께한 기사님의 평점과 리뷰를 작성해주세요</small></h1><hr>
						
	<div class="container" style="width:1000px; margin: 0 auto;">
		<div class="row">
			
		</div>
		<div class="container" style="width:800px; margin: 0 auto;">
		<table class="table">
			
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="250">
				<col width="50">
				<col width="100">
				
				<tr>
					<th>날짜</th><th>기사님</th><th>시간</th><th>경로</th><th>인원</th><th>신청일</th>
				</tr>
				<c:forEach var="dto" items="${list }">	
				<tr>
					<td>${dto.s_date }</td> 
					<td><a href="ReviewController?command=selectOne&s_seq=${dto.s_seq }">${dto.d_name }</a></td>
					<td>${dto.s_time }</td>
					<td>${dto.s_course }</td>
					<td>${dto.s_people }</td>
					<td>${dto.s_regdate }</td>
				</tr>
				</c:forEach>

		</table>
	<input style="float:right" type="button" value="홈으로 가기" onclick="location.href='index.jsp'" class="btn btn-default" style="float: right">

			</div>
			</div>
			

			
			



			<%@ include file="form/footer.jsp"%>
</body>
</html>