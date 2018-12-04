<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>				
<% response.setContentType("text/html; charset=UTF-8"); %> 
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
<style>
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	border-top:0;
}
</style>
</head>
<body>
<%@ include file="form/header.jsp" %>

<script>
$(document).ready(function() {
    $('#datePicker')
        .datepicker({
            format: 'mm/dd/yyyy'
        })
});
</script>
</head>
<body>

<h1 align="center">${dto.u_name}님의 일정 예약하기</h1><br><hr>
<div class="container-fluid">
	<div class="container" style="width:400px">
		<div align="center" >
			<div class="form-group">
				<table class="table table-borderless">
					<col width="50">
					<col width="150">
					<tr>
						<th>날 짜</th>
						<td>
							<div class="input-group input-append date" id="datePicker">
               					<input type="text" class="form-control" id="date" />
               					<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
           					</div>
           				</td>
					</tr>
					<tr>
						<th>시 간</th>
						<td>
							<select id="time" class="form-control">
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
						<td></td>
					</tr>
					<tr>
						<th>인 원</th>
						<td>
							<select id="people" class="form-control">
								<option>------인원선택------</option>
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>코 스</th>
						<td><span id="course"></span></td>
					</tr>
					<tr>
						<th>금 액</th>
						<td><span id="money">100,000</span></td>
					</tr>
				</table>
				</div>
			</div>
		</div>

		<br><hr>
		<div class="row" align="center">
			<h1><span>예약 하시겠습니까?</span></h1>
			<input type="button" value="확인" class="btn btn-default btn-big" onclick="location.href='DriverController?command=driverlist'"/>
			<input type="button" value="취소" class="btn btn-default btn-big" onclick="location.href='makeplan.jsp'"/>
		</div>
	</div>
	
	
	<script src="makeplanAjax.js"></script>
	<script src="midinsert.js"></script>



<%@ include file="form/footer.jsp" %>

</body>
</html>