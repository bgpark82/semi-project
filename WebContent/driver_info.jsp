<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.taxi.driver.dto.DriverDto"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
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
<style>
.glyphicon-star{
	cursor: pointer;
}
.glyphicon-star.on{
	color:orange;
}
</style>	

<script type="text/javascript">

	function updatedriver(d_no) {
		location.href="DriverController?command=driverupdateform&d_no=" + d_no;
	}
	
	function deletedriver(d_no) {
		location.href="DriverController?command=driverdelete&d_no=" + d_no;
	}
	
	function confirmed(chk){
		var s_seq = $(chk).attr("id");
		$.ajax({
			type: "post",
			url:"ScheduleController",
			data:{
				command:"checkConfirmed",
				s_seq:s_seq
			},
			success:function(data){
				alert(data);
			}
		})
	}
	
	function rejected(chk){
		var s_seq = $(chk).attr("id");
		$.ajax({
			type: "post",
			url:"ScheduleController",
			data:{
				command:"rejected",
				s_seq:s_seq
			},
			success:function(data){
				alert(data);
			}
		})
	}

</script>



</head>
<body>
	<%@ include file="form/header.jsp"%>

	<div class="container">
		<br>
		<h1>마이페이지</h1>
		<br>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<table class="table ">
					<col width="150" />
					<col width="300" />
					<tr>
						<th>프로필 사진</th>
						<td><img
							style="width: 200px; height: 200px; border-radius: 100%;"
							src="${dto.d_profile }" /></td>
						
						<!-- 별점 표시 -->	
						<div class="star" style="font-size:30px;">	
						<c:choose>
							<c:when test="${rating != 0 }">
								<c:forEach begin="1" end="${rating }" step="1">
									<span class="glyphicon glyphicon-star on"></span>
								</c:forEach>
								<c:forEach begin="${rating +1}" end="5" step="1">
									<span class="glyphicon glyphicon-star"></span>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
							</c:otherwise>	
						</c:choose>	
						</div>	
						
					</tr>
					<tr>
						<th>아이디</th>
						<td>${dto.d_id }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>${dto.d_pw }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${dto.d_name }</td>
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
						<th>지역</th>
						<td>${dto.d_region }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${dto.d_phone }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${dto.d_email }</td>
					</tr>
					<tr>
						<th>운전면허번호</th>
						<td>${dto.d_license }</td>
					</tr>
					<tr>
						<th>차량번호</th>
						<td>${dto.d_carnum }</td>
					</tr>
					<tr>
						<td colspan="5"><input type="button" value="수정"
							onclick="updatedriver(${dto.d_no});" /> <input type="button"
							value="탈퇴" onclick="deletedriver(${dto.d_no});" /> <input
							type="button" value="목록"
							onclick="location.href='driver_main.jsp'" /> <input
							type="button" value="운전자전체목록"
							onclick="location.href='DriverController?command=driverlist'" />
						</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6">
				<h2>요청 정보</h2>
				<ul>
					<li class="list-group-item" style="width: 100%">
						<div class="container" style="max-height: 150px; width: 100%">
							<div class="row">
								<c:forEach var="dto" items="${scheduleList }">
									
									<div class="col-xs-6" style="margin-top: 0px;">
										<div style="margin-bottom: 5px">
											<h3>
												<strong>${dto.u_name }</strong>
											</h3>
										</div>
										<div style="margin-bottom: 5px">
											<b>시간 </b><span>${dto.s_time }</span>
										</div>
										<div style="margin-bottom: 5px">
											<b>인원수 </b><span>${dto.s_people }</span>
										</div>
										<div style="margin-bottom: 5px">
											<b>경로 </b> <span>${dto.s_course }</span>
										</div>
									</div>

									<div class="col-xs-6" style="margin-top: 18px; padding: 0px;">
										<!-- <label class="checkbox-inline"> -->
										<input type="button" value="보기" class="btn btn-default">
										<input id="${dto.s_seq }" type="button" value="선택" class="btn btn-primary" onclick="confirmed(this)">
										<input id="${dto.s_seq }" type="button" value="거절" class="btn btn-danger" onclick="rejected(this)">
										<!-- </label> -->
									</div>
								</c:forEach>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<%@ include file="form/footer.jsp"%>
</body>
</html>















