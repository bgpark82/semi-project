<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
	<% response.setContentType("text/html; charset=UTF-8"); %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>글 목록</h1>
	
	<table border="1">
		<col width="50"><col width="150"><col width="350">
		<col width="100"><col width="100"><col width="50">
		<tr>
			<th>번호</th>
			<th>지역</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="6">=====작성된 글이 없습니다=====</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.r_no }</td>
						<td>${dto.r_area }</td>
						<td><a href="RBoardController?command=selectone&r_no=${dto.r_no }&r_count=${dto.r_count+1}">${dto.r_title }</a></td>
						<td>${dto.r_writer }</td>
						<td>${dto.r_date }</td>
						<td>${dto.r_count }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="6">
				<input type="button" value="글 쓰기" onclick="location.href='RBoardController?command=writeform'"/>
			</td>
		</tr>
	
	</table>

</body>
</html>