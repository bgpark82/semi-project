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
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!-- date picker css -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />


<style>
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	border-top:0;
}
</style>
</head>
<body>
<%@ include file="form/header.jsp" %>


</head>
<body>

<c:choose>
	<c:when test="${userDto.u_name != null }">
		<br><h1 align="center">${userDto.u_name}&nbsp;<small>님의 일정 예약하기</small></h1><br><hr>
	</c:when>
</c:choose>


<div class="container-fluid">
	<div class="container" style="width:500px">
	<div class="panel panel-default">
	<div class="panel-body">
		<div align="center" >
			<div class="form-group">
				<form method="post" action="ScheduleController">
					<input type="hidden" name="command" value="schedule">
					<input type="hidden" name="lat" value="${dto.s_latitude }">
					<input type="hidden" name="lng" value="${dto.s_longitude }">
					<input type="hidden" name="course" value="${dto.s_course }">
					<table class="table table-borderless">
						<col width="50">
						<col width="150">
						<tr>
							<th>날 짜</th>
							<td>
								<div class="input-group input-append date" id="datePicker">
									<input type="text" class="form-control" name="date" />
									<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
								</div>
	           				</td>
						</tr>
						<tr>
							<th>시 간</th>
							<td>
								<select id="time" name="time" class="form-control">
									<option>------시작시간------</option>
									<option value="6">오전 6:00</option>
									<option value="7">오전 7:00</option>
									<option value="8">오전 8:00</option>
									<option value="9">오전 9:00</option>
									<option value="10">오전 10:00</option>
									<option value="11">오전 11:00</option>
									<option value="12">오후 12:00</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>지 역</th>
							<td>
								<input type="text" name="location" value="${dto.s_location }" class="form-control" readonly>
							</td>
						</tr>
						<tr>
							<th>인 원</th>
							<td>
								<select id="people" name="people" class="form-control">
									<option>------인원선택------</option>
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>코 스</th>
							<td>
								<%-- <c:forEach var="value" items="${list }" >
									<c:out value="${value }"></c:out><span>&nbsp;&nbsp; -> &nbsp;&nbsp;</span>
								</c:forEach> --%>
								<!-- <input type="text" name="course" value="" readonly> -->
								${dto.s_course }
							</td>
						</tr>
						<tr>
							<th>금 액</th>
							<td>
								<input type="text" class="form-control" id="price" name="price" readonly >
							</td>
						</tr>
					</table>
					<br><hr>
		<div class="row" align="center">
		
			<h1>예약 하시겠습니까?</h1><br>
			<input type="submit" value="확인" class="btn btn-default btn-big" />
			<input type="button" value="취소" class="btn btn-default btn-big" onclick="history.back()"/>
		</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
	
	
<!-- date picker bootstrap -->
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<script>
$(document).ready(function() {
    $('#datePicker').datepicker({
		format: 'yyyy-mm-dd'
	})
});

$("#people").on("change",function(){
	var num = $("#people option:selected").val()
	if(num == 1){
		$("#price").val("100,000");
	} else if(num == 2){
		$("#price").val("180,000");
	} else {
		$("#price").val("240,000");
	}
})

</script>


<%@ include file="form/footer.jsp" %>

</body>
</html>