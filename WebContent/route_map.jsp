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
<!-- custom.css -->
<link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
<body>
<%@ include file="form/header.jsp" %>

	
	<fieldset>
		
		<select id="local">
			<option>-------지역선택-------</option>
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
		
		<div class="container-fluid">
			<div class="row">
			
				<!-- left box -->
				<div class="col-md-2">
					<ul><ins id="trip_info"></ins></ul>
				</div>
				
				<!-- map -->
				<div class="col-md-8">
					<!-- search box -->
					<div class="pac-card" id="pac-card">
						<div id="pac-container">
					        <input id="pac-input" type="text" placeholder="Enter a location">
						</div>
					</div>
					<!-- google map -->
					<div id="map"></div>
				</div>
				
				<!-- right box -->
				<div class="col-md-2">
					<div class="card">
						<div class="card-body"><h2><span id="totalDuration"></span></h2></div>
					</div>
					<ul><ins id="trip_selected"></ins></ul>
				</div>
				<form action="ScheduleController" method="post" id="route">
					<input type="hidden" name="command" value="route">
					<input type="button" value="경로지정" class="btn btn-default btn-lg" onclick="sendData()">
				</form>
				
			</div>
		</div>
		
		<div id="infowindow-content">
      <img src="" width="16" height="16" id="place-icon">
      <span id="place-name"  class="title"></span><br>
      <span id="place-address"></span>
    </div>
	</fieldset><br>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDogTL8Fk8vbPq2JCZrZKedH35rNtSGKJE&libraries=places&callback=initMap"></script>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="js/map.js"></script>
<script>

	function sendData(){
		var placeList = [];
		var list = $("#trip_selected").find("li");
		var location = $("#local option:selected").text();
		for(var i = 0; i < list.length; i++){
			placeList.push(list.eq(i).find("#title").html());
		};
		var listToJson = JSON.stringify(placeList);
		$("#route").append("<input type='hidden' name='location' value="+location+">");
		$("#route").append("<input type='hidden' name='list' value="+listToJson+">");
		$("#route").submit();
	}
</script>


<%@ include file="form/footer.jsp" %>
</body>
</html>