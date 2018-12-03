<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>			 
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import ="com.taxi.driver.dto.DriverDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<%
	DriverDto dto = (DriverDto)request.getAttribute("dto");
%>


<body>

	<h1>회원정보 수정</h1>
	
	<form action="DriverController" method="post" id="driverupdate">
		<input type="hidden" name="command"	value="driverupdate" >
		<input type="hidden" name="d_no" value="${dto.d_no }">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>${dto.d_no }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${dto.d_id }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="d_pw" value="<%=dto.getD_pw() %>" /></td>
			</tr>									
			<tr>
				<th>생년월일</th>
				<td>${dto.d_birth }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${dto.d_gender }</td>
			</tr>								
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="d_phone" value="<%=dto.getD_phone() %>" /></td>
			</tr>		
			<tr>
				<th>이메일</th>
				<td><input type="text" name="d_email" value="<%=dto.getD_email() %>" /></td>
			</tr>		
			<tr>
				<th>차량번호</th>
				<td><input type="text" name="d_carnum" value="<%=dto.getD_carnum() %>" /></td>
			</tr>		
			<tr>
				<th>면허번호</th>
				<td><input type="text" name="d_license" value="<%=dto.getD_license() %>" /></td>
			</tr>		
			<tr>
			<td colspan="2">
			<input type="submit" value="완료" />
			
			</td>
			</tr>				
		</table>
	</form>
</body>
</html>