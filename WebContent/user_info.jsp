<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.taxi.user.dto.UserDto"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<link rel="stylesheet" href="css/timeline.css">

<script type="text/javascript">
	$(function() {
		$("#userupdate").submit(
				function() {
					alert($("input[name=pw2]").val());
					if ($("input[name=pw2]").val() == null
							|| $("input[name=pw2]").val() == "") {
						return true;
					} else if ($("input[name=pw2]").val() != $(
							"input[name=pw1]").val()) {
						alert("비밀번호가 맞지 않습니다.");
						return false;
					}
				});
	});
</script>


</head>
<body>
	<%@ include file="form/header.jsp"%>

	<%
		UserDto dto = (UserDto) request.getAttribute("dto");
	%>



	<div class="container" style="width:500px;">
		<br>
		<br><h1 style="text-align:center">마이페이지</h1><br><hr>
		
		
		
	<!-- 	<div class="row">
			<div class="col-md-6"> -->
				<div class="panel panel-default">
					<div class="panel-body">
				<form action="UserController?commad=" method="post" id="userupdate">
					<input type="hidden" name="command" value="userupdate"> 
					<input type="hidden" name="u_no" value="${dto.u_no }">
					<table class="table">
						
						<tr>
							<th>이 름</th>
							<td>${dto.u_name }</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${dto.u_birth }</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>${dto.u_gender }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${dto.u_id }</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pw1" value="${dto.u_pw }" class="form-control">
							</td>
						</tr>
						<tr>
							<th>비밀번호 재확인</th>
							<td><input type="password" name="pw2" class="form-control"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="u_email"
								value="${dto.u_email }" class="form-control"></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td><input type="text" name="u_phone"
								value="${dto.u_phone }" class="form-control"></td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="submit" value="수정하기" class="btn btn-default" style="float:right"/> 
							<input type="button" value="탈퇴하기" onclick="location.href='UserController?command=userout&u_no=${dto.u_no}'" class='btn btn-default' style="float:right"/>
							</td>
						</tr>
					</table>
				</form>
				</div>
				</div>
			</div>
			<!-- <div class="col-md-6">
				<ul>
					<li class="list-group-item" style="width:100%" >
  							<div class="container" style="max-height: 150px; width:100%">
  								<div class="row">
	     							<div class="col-xs-4"><img src="img/td.png" width="150px"/></div>
	  								<div class="col-xs-4" style="margin-top: 0px;">
										<div style="margin-bottom: 5px"><h3><strong></strong></h3></div>
										<div style="margin-bottom: 5px"><b>성별 </b><span></span></div>
										<div style="margin-bottom: 5px"><b>나이 </b><span></span></div>               
										<div style="margin-bottom: 5px"><b>지역 </b> <span></span></div>
									</div>    
	     
									<div class="col-xs-4" style="margin-top: 18px; padding:0px;">
										<div>
											<span class="fa fa-star checked"></span>
											<span class="fa fa-star checked"></span>
											<span class="fa fa-star checked"></span>
											<span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
										</div>
		     							<div style="margin: 45% 0 50% 0">
											<label class="checkbox-inline">
											<input type="button" value="보기"  class="btn btn-default" >
											<input type="button" value="선택"  class="btn btn-primary" >
											<input type="button" value="거절"  class="btn btn-danger" >
											</label>
										</div>
	     							</div>
     							</div>    
							</div>
						</li>
				</ul>
			</div> -->
		<!-- </div>
	</div> -->





	<%@ include file="form/footer.jsp"%>

</body>
</html>