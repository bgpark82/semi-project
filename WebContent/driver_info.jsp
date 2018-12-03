<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.taxi.driver.dto.DriverDto" %>    
<% request.setCharacterEncoding("UTF-8"); %>			 
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function updatedriver(d_no) {
		location.href="DriverController?command=driverupdateform&d_no=" + d_no;
	}
	
	function deletedriver(d_no) {
		location.href="DriverController?command=driverdelete&d_no=" + d_no;
	}

</script>


</head>
<body>
<%
	DriverDto dto = (DriverDto)request.getAttribute("dto");
%>

	<h1>마이페이지</h1>
	
	<table border ="1">
		<col width="150" />
		<col width="300" />
	<tr>
		<th>아이디</th>
		<td><%=dto.getD_id() %></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><%=dto.getD_pw() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=dto.getD_name() %></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><%=dto.getD_birth() %></td>
	</tr>
	<tr>
		<th>성별</th>
		<td><%=dto.getD_gender() %></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=dto.getD_phone() %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=dto.getD_email() %></td>
	</tr>
	<tr>
		<th>운전면허번호</th>
		<td><%=dto.getD_license() %></td>
	</tr>
	<tr>
		<th>차량번호</th>
		<td><%=dto.getD_carnum() %></td>
	</tr>
	<tr>
		<th>등급</th>
		<td><%=dto.getD_role().equals("DRIVER")?"운전자":"여행자" %></td>
	</tr>
		<tr>
			<td colspan="5">
				<input type="button" value="수정" onclick="updatedriver(<%=dto.getD_no() %>);" />
				<input type="button" value="탈퇴" onclick="deletedriver(<%=dto.getD_no() %>);" />
				<input type="button" value="목록" onclick="location.href='driver_main.jsp'" />
				<input type="button" value="운전자전체목록" onclick="location.href='driver_list.jsp'" />
			</td>
		</tr>
	
	</table>

</body>
</html>















