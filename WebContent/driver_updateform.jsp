<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>			 
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import ="com.taxi.driver.dao.DriverDao" %>
<%@ page import ="com.taxi.driver.dto.DriverDto" %>
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
<%
	DriverDto dto = (DriverDto)request.getAttribute("dto");
	String d_id = dto.getD_id();
	/* String driverProfile = new DriverDao().getProfile(d_id); */

%>


<body>
<%@ include file="form/header.jsp" %>
	<h1>회원정보 수정</h1>
	
	<form action="DriverController" method="post" id="driverupdate">
		<input type="hidden" name="command"	value="driverupdate" >
		<input type="hidden" name="d_no" value="${dto.d_no }">
		<table border="1">
			
			<tr>
				<th>프로필 사진</th>
				<td>
				<img style="width: 50px; height: 50px;" src="driverProfile"/>
				<input type="button" value="사진 변경하기" onclick="location.href='driver_profileupdate.jsp?d_id=${dto.d_id}'"/>
				</td>
			</tr>
			<tr>
				<td><h5>사진 업로드</h5></td>
				<td colspan="2">
					<span>
					이미지를 업로드하세요.<input type="file" name="driverProfile" >
					</span>
				</td>
			</tr>
			
			
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
<%@ include file="form/footer.jsp" %>
</body>
</html>