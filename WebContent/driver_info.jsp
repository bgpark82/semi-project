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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.glyphicon-star{
	cursor: pointer;
	font-size: 30px;
}
.glyphicon-star.on{
	color:orange;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	border-top:0px;
}
th{
	text-align:right;
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

	
		<br>
		<h1><span style="margin-left:280px;">마이페이지</span> <span style="float:right; margin-right:320px;">요청 정보</span></h1><br><hr>
		
		<div class="container">
			<div class="row">
				<div class="col-md-1" ></div>
				<div class="col-md-5" style="text-align:center; width:400px;">
					<div class="panel panel-default">	
						<div class="panel-body">
							<img style="width: 200px; height: 200px; border-radius: 100%; " src="${dto.d_profile }" />
								<div class="star">
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
				
				<table class="table">
					<col width="60px" />
					<col width="50px" />
					<tr>
						<td>
						</td>
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
				</table>
				
				<input type="button" value="수정" onclick="updatedriver(${dto.d_no});" class="btn btn-default form-control" /> 
				<input type="button" value="탈퇴" onclick="deletedriver(${dto.d_no});" class="btn btn-default form-control"/> 
				</div>
			</div>
			</div>
			<div class="col-md-6">

						<div class="container">
							<div class="row">
								<div class="col-xs-6">
								<ul>
								<c:forEach var="scheduleDto" items="${scheduleList }">
									<li class="list-group-item" style="width: 100%">				
					
										<div >
											<h3 style="margin-top:10px; margin-bottom:10px;">
												<strong style="margin-left:20px;">${scheduleDto.u_name }</strong>
												<div style="float:right;">
													<input type="button" value="보기" class="btn btn-default">
													<input id="${scheduleDto.s_seq }" type="button" value="선택" class="btn btn-primary" onclick="confirmed(this)">
													<input id="${scheduleDto.s_seq }" type="button" value="거절" class="btn btn-danger" onclick="rejected(this)">
												</div>
											</h3>
										</div>
										<table class="table" style="margin-bottom:0px;">
										<tr>
											<td>시간</td>
											<td>${scheduleDto.s_time }시</td>
										</tr>
										<tr>
											<td>일자</td>
											<td>${scheduleDto.s_date }</td>
										</tr>
										<tr>
											<td>인원수</td>
											<td>${scheduleDto.s_people }명</td>
										</tr>
										<tr>
											<td>경로</td>
											<td>${scheduleDto.s_course }</td>
										</tr>
										</table>
										
						
						<div class="col-xs-6" style="margin-top: 18px; padding: 0px;">
										<!-- <label class="checkbox-inline"> -->
										
										<!-- </label> -->
									</div>
									</li>
								</c:forEach>
								
						</ul>
						</div>
							</div>
						</div>
				
			</div>
		</div>
	</div>

	<%@ include file="form/footer.jsp"%>
</body>
</html>















