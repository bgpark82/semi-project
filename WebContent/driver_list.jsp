<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.taxi.driver.dto.DriverDto"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	DriverDto dto = (DriverDto) request.getAttribute("dto");
%>


<body>

	<h1>운전자정보조회리스트</h1>

	<table border="1">
		<col width="50" />
		<col width="300" />
		<col width="100" />
		<col width="50" />
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
		</tr>

		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4">-------작성된 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td><%=dto.getD_no()%></td>
						<td><a href="DriverController?command=driverinfo&seq=${dto.d_no}"><%=dto.getD_name()%></a></td>
						<td><%=dto.getD_birth()%></td>
						<td><%=dto.getD_gender()%></td>
					</tr>
				</c:forEach>
		</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4">
				<button onclick="location.href='driver_main.jsp'">메인</button>
			</td>
		</tr>
	</table>


</body>
</html>





















