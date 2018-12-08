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
<!-- css -->
<link href="css/index.css" rel="stylesheet"/>
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">




</head>
<body>

<%@ include file="form/header.jsp" %>
     
	
	<!-- 1번 배경 -->
<div id="home">
   <div class="landing-text">
      <h1>TaxiRo</h1>
      <h3>당신의 여행을 편하게 TaxiRo!</h3>
      <button class="btn btn-default btn-lg" onclick="location.href='route_map.jsp'">일정 만들기</button><br><br><br><br><br><br><br><br>
   </div>
</div>

<div class="padding">
<div class="container">
   <div class="row">
      <div class="col-sm-6">
         <img src="img/best.jpeg">
      </div>
      <div class="col-sm-6 text-center"><br><br><br><br>
         <h2><b>사용자가 선정한 Best 여행지!</b></h2>
         <p class="lead">
            어디로 여행을 가야하는지! 어디가 명소인지 궁금하다면? 
        </p>
         <p class="lead">
           TaxiRo에서는 직접 다녀온 여행지 리뷰게시판에서 추천수가 높은 코스와 관광지를 한눈에 볼 수 있습니다! 
         </p>
      </div>

   </div>
</div>
</div>

<div class="padding">
<div class="container">
   <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
         <h4><b>오 나의 기사님!</b></h4>
         <p>
            기분좋게 떠나는 여행.<br> 
            하루종일 함께하는 기사님을 여행객 스스로 선택할 수 있는 TaxiRo!<br>
            TaxiRo에서는 여행객이 일정을 만들때, 
            해당 지역의 기사님 리스트와 평점을 보여주어 여행객 스스로 원하는 기사님을 3명! 우선선택 할 수 있습니다.        
         </p>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
         <img src="img/car.jpg" class="img-responsive">
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <h4><b>내가 선택하는 코스!</b></h4>
            <p>
                패키지로 짜여진 코스를 원하지 않는다면?
                자신이 직접 자신만의 여행지를 여행하고 싶다면?<br>
                TaxiRo에서는 각 지역마다 관광지를 볼 수 있으며, 자신이 선택한 관광지로 자신만의 여행코스를 만들 수 있습니다!    
            </p>
      </div>      
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <img src="img/course.jpeg" class="img-responsive">
      </div>                           
   </div>
</div>
</div>

<div id="fixed">
</div>

<div class="padding">
<div class="container">
   <div class="row">
         <div class="col-sm-6">      
         <h4><b>여행객을 위한, 기사님을 위한 TaxiRo!</b></h4>
         <p>
            TaxiRo는 여행객이 보다 편리하게 떠날 수 있는 홈페이지 입니다.<br>
            또한 택시기사님은 자신이 잘 알고있는 지역을 소개하며, 하루에 한명의 탑승자로 편리하게 수익을 낼 수 있습니다.<br>
            각 지역의 경제발전과 관광산업의 공동발전을 추구하며, 여행객과 기사님 모두를 생각하는 TaxiRo!
            이제는 여행 갈때 자신이 기사님을 선택할 수 있고, 여행코스를 지정할 수 있으며, 자신만의 택시로 편리하게 여행하세요.
            TaxiRo가 당신의 여행을 함께 하겠습니다!
         </p>
         
      </div>       
      <div class="col-sm-6">
         <img src="img/taxi2.png">
      </div>      
   </div>
</div>
</div>



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 

<%@ include file="form/footer.jsp" %>


</body>
</html>