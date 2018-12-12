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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="css/register.css">
</head>
<body>
<%@ include file="form/header.jsp" %>



<div class="container-fluid row" style="margin-bottom: 10%;">
	
	<br><h1 style="text-align: center;">회 원 가 입</h1><br><hr>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
<div class="col-md-2"></div>


<div class="container col-md-3" style="margin-top:5%">

<img class="image" src="img/driver.png" style="cursor: pointer;">
  <div class="overlay" onclick="location.href='DriverController?command=registform'" style="cursor: pointer;">
    <div class="text"><strong>운전자</strong></div>
  </div>
</div>

<div class="col-md-2">

</div>

<div class="container col-md-3" style="margin-top:5%">

<img class="image" src="img/user.png" style="cursor: pointer;">
  <div class="overlay" onclick="location.href='UserController?command=registform'" style="cursor: pointer;" >
    <div class="text"><strong>사용자</strong></div>
  </div>
</div>



<div class="col-md-2"></div>
</div>


</div>



<%@ include file="form/footer.jsp" %>

</body>
</html>