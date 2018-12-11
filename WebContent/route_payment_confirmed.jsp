<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<style type="text/css">
#map {
	height: 400px;
	width: 100%;
}
th{
	width:50px;
}
.glyphicon-star{
  
  cursor: pointer;
}
.glyphicon-star.on{
	color:orange;
}

</style>
</head>
<body>
	<%@ include file="form/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					결제완료 <small>예약한 상세내용과 선택한 기사님을 확인하세요</small> <input type="button"
						value="홈으로 가기" onclick="location.href='index.jsp'"
						class="btn btn-default" style="float: right">
				</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-5 col-md-5">
				<div id="map"></div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="panel panel-default" style="height: 400px">
					<div class="panel-body">
						<table class="table">
							<tr>
								<th>지역</th>
								<td>${scheduleDto.s_location }</td>
							</tr>
							<tr>
								<th>날짜</th>
								<td>${scheduleDto.s_date }</td>
							</tr>
							<tr>
								<th>인원</th>
								<td>${scheduleDto.s_people }명</td>
							</tr>
							<tr>
								<th>금액</th>
								<td>${scheduleDto.s_price }원</td>
							</tr>
							<tr>
								<th>경로</th>
								<td>
									${scheduleDto.s_course }
									<!--  <li id="+id+" data_lat="+latitude+" data_lng="+longitude+" onclick='closeList(this)'>
									<div class='panel panel-default' style='margin-bottom:0px;'>
									<div class='panel-body' style='font-size:17px;'>
									<span class='glyphicon glyphicon-map-marker' style='color:red; ' ></span>
									<span id='title'>"+title+"</span><br>
									<span id='addr1'>"+addr1+"</span><br>
									</div></div></li> -->
								</td>
							</tr>

						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 portfolio-item" align="center">
				<div class="panel panel-default" style="height:400px">
					<div class="panel-body">
						<img class="img-responsive"
							style="width: 200px; height: 200px; border-radius: 100%;"
							src="${driverDto.d_profile }">
						<h3>${driverDto.d_name }</h3>
						<c:choose>
							<c:when test="${driverDto.ra_rating != 0 }">
								<c:forEach begin="1" end="${driverDto.ra_rating }" step="1">
									<span class="glyphicon glyphicon-star on"></span>
								</c:forEach>
								<c:forEach begin="${driverDto.ra_rating +1}" end="5" step="1">
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
						<h4>
							<b>성별 :</b> ${driverDto.d_gender }
						</h4>
						<h4>
							<b>지역 :</b> ${driverDto.d_region }
						</h4>
					</div>

				</div>


			</div>
			</div>
			</div>

			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDogTL8Fk8vbPq2JCZrZKedH35rNtSGKJE&libraries=places"></script>
			<script type="text/javascript" src="js/schedule.js"></script>



			<%@ include file="form/footer.jsp"%>
</body>
</html>