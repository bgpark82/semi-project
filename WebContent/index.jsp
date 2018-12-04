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
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- css -->
<link href="css/style.css" rel="stylesheet"/>
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<%@ include file="form/header.jsp" %>
     
	
	
	
	<!-- 1번 배경 -->
<div id="home">
   <div class="landing-text">
      <h1>BOOTSTRAP</h1>
      <h3>Learn the basic building blocks.</h3>
      <button class="btn btn-default btn-lg" onclick="location.href='route_map.jsp'">Get Started</button>
   </div>
</div>

<div class="padding">
<div class="container">
   <div class="row">
      <div class="col-sm-6">
         <img src="img/bootstrap.png">
      </div>
      <div class="col-sm-6 text-center">
         <h2>All About Using Bootstrap.</h2>
         <p class="lead">부트스트랩은...어렵고 짲응이 나지만 그냥 해야한다,,,
            집에 가고싶은것이 솔찍헌 헤징희의 심정...
         </p>
         <p class="lead">부트스트랩은...어렵고 짲응이 나지만 그냥 해야한다,,,
               집에 가고싶은것이 솔찍헌 헤징희의 심정...
         </p>
      </div>

   </div>
</div>
</div>

<div class="padding">
<div class="container">
   <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
         <h4>Built with Sass</h4>
         <p>여수밤바다:여수 밤바다 이 바람에 걸린 알 수 없는 향기가 있어
               네게 전해주고파 전활 걸어 뭐하고 있냐고
               나는 지금 여수 밤바다 여수 밤바다
               
               아 아 아 아 아 어 어 
               
               
               너와 함께 걷고 싶다
               이 바다를 너와 함께 걷고 싶어
               이 거리를 너와 함께 걷고 싶다
               이 바다를 너와 함께 너와 함께 오
               </p>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
         <img src="img/sass.png" class="img-responsive">
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <h4>And Less</h4>
            <p>여수밤바다:여수 밤바다 이 바람에 걸린 알 수 없는 향기가 있어
                  네게 전해주고파 전활 걸어 뭐하고 있냐고
                  나는 지금 여수 밤바다 여수 밤바다
                  
                  아 아 아 아 아 어 어 
                  
                  
                  너와 함께 걷고 싶다
                  이 바다를 너와 함께 걷고 싶어
                  이 거리를 너와 함께 걷고 싶다
                  이 바다를 너와 함께 너와 함께 오
                  </p>
      </div>      
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <img src="img/less.png" class="img-responsive">
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
         <h4>Here's the cool thing about Bootstrap...</h4>
         <p>부트스트랩은...어렵고 짲응이 나지만 그냥 해야한다,,,
            집에 가고싶은것이 솔찍헌 헤징희의 심정...
            부트스트랩은...어렵고 짲응이 나지만 그냥 해야한다,,,
            집에 가고싶은것이 솔찍헌 헤징희의 심정...
            부트스트랩은...어렵고 짲응이 나지만 그냥 해야한다,,,
            집에 가고싶은것이 솔찍헌 헤징희의 심정...
         </p>
         <p>부트스트랩은...어렵고 짲응이 나지만 그냥 해야한다,,,
            집에 가고싶은것이 솔찍헌 헤징희의 심정...
            부트스트랩은...어렵고 짲응이 나지만 그냥 해야한다,,,
            집에 가고싶은것이 솔찍헌 헤징희의 심정...
            부트스트랩은...어렵고 짲응이 나지만 그냥 해야한다,,,
            집에 가고싶은것이 솔찍헌 헤징희의 심정...   
         </p>   
      </div>       
      <div class="col-sm-6">
         <img src="img/bootstrap2.png">
      </div>      
   </div>
</div>
</div>


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 

<%@ include file="form/footer.jsp" %>


</body>
</html>