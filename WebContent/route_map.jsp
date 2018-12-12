<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>				
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
<!-- custom.css -->
<link rel="stylesheet" type="text/css" href="css/map.css">
</head>
<body>
<%@ include file="form/header.jsp" %>

		<c:choose>
			<c:when test="${userDto.u_name == null }">
				<script>
					alert("사용자 계정으로 로그인 해주세요");
					location.href="index.jsp";
				</script>
			</c:when>
		</c:choose>

		
		<input type="button" value="경로지정" class="btn btn-default btn-lg" style="float:right; margin-right:1%; margin-top:3px; width:190px;" onclick="sendData()">
		
		
		
		<div class="container-fluid" style="height:600px;">
			<div class="row">
			
				<!-- left box -->
				<div class="col-md-2">
					<div class="form-group" style="margin-bottom:5px;">
					<select id="local" class="form-control" onchange="showLocation(this);">
						<option >지역을 선택해주세요</option>
						<option value="1">서울</option>
						<option value="2">인천</option>
						<option value="3">대전</option>
						<option value="4">대구</option>
						<option value="5">광주</option>
						<option value="6">부산</option>
						<option value="7">울산</option>
						<option value="8">세종특별자치시</option>
						<option value="31">경기도</option>
						<option value="32">강원도</option>
						<option value="33">충청북도</option>
						<option value="34">충청남도</option>
						<option value="35">경상북도</option>
						<option value="36">경상남도</option>
						<option value="37">전라북도</option>
						<option value="38">전라남도</option>
						<option value="39">제주도</option>
					</select>
					</div>
					
					<ul class="pagination" style="margin:0px; margin-left:20%; text-align:center;">
					  <li><a href="#">&laquo;</a></li>
					  <li><a id="left" href="#" onclick="showLocation(this);">&lsaquo;</a></li>
					  <li><a id="right" href="#" onclick="showLocation(this);">&rsaquo;</a></li>
					  <li><a href="#">&raquo;</a></li>
					</ul>
					<ul>
						<div id="trip_info" ></div>
					</ul>
				</div>
				
				
				
				
				
				
				
				<!-- map -->
				<div class="col-md-8">
					<!-- search box -->
					<!-- <div class="pac-card" id="pac-card">
						<div id="pac-container">
					        <input id="pac-input" type="text" placeholder="Enter a location">
						</div>
					</div> -->
					<!-- google map -->
					<div id="map"></div>
				</div>
				
			
				<!-- right box -->
				<div class="col-md-2">
					<div class="card">
						<div class="card-body">
							<div class="panel panel-default" style="margin-bottom:10px;">
								<div class="panel-body">
									<h3 style="margin-top:10px; ">&nbsp;<span class="glyphicon glyphicon-time"></span>&nbsp;<span id="totalDuration"></span></h3>
								</div>
							</div>
						</div>
					</div>
					<div style="height:700px; overflow-y:scroll">
						<ul>
							<div id="trip_selected">
							</div>
						</ul>
						
					</div>
				</div>
				<form action="ScheduleController" method="post" id="route">
					<input type="hidden" name="command" value="route">
				</form>
				
			</div>
			
		</div>
	
	<!-- geoCode -->	
	<!-- <div id="infowindow-content">
      <img src="" width="16" height="16" id="place-icon">
      <span id="place-name"  class="title"></span><br>
      <span id="place-address"></span>
    </div> -->
	
	

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDogTL8Fk8vbPq2JCZrZKedH35rNtSGKJE&libraries=places&callback=initMap"></script>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="js/map.js"></script>
<script>

	function sendData(){
		var course = "";
		var latitude = "";
		var longitude = "";
		var location = $("#local option:selected").text();
		
		var list = $("#trip_selected").find("li");
		for(var i = 0; i < list.length; i++){
			course += list.eq(i).find("#title").html() +"/"
			latitude += list.eq(i).attr("data_lat") +"/"
			longitude += list.eq(i).attr("data_lng") +"/"
		};
		$("#route").append("<input type='hidden' name='location' value="+location+">");
		$("#route").append("<input type='hidden' name='course' value="+course+">");
		$("#route").append("<input type='hidden' name='lat' value="+latitude+">");
		$("#route").append("<input type='hidden' name='lng' value="+longitude+">");
		$("#route").submit();
	}
</script>


<%@ include file="form/footer.jsp" %>
</body>
</html>