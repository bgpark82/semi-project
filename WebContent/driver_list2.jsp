<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- Custom CSS for the 'Thumbnail Gallery' Template -->
<link href="css/driver_list.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

</head>
<body>

   <div class="container">
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header">
            Best 여행지<small> 사용자들이 작성한 리뷰 중 인기글!</small>
         </h1>
      </div>
   </div>
   <div class="row">
   <div class="col-md-3">
      <h2>부산</h2>
      <div class="card">
               <img class="card-img-top" src="img/review1.jpg" alt="Card image" style="width:100%">
      
         <div class="card-body">
            <h4 class="card-title">가덕도등대</h4>
               <p>바다냄새도 좋고, 등대도 이쁘구 ㅜㅜ 모든순간이 이뻤다~~ </p>   
         </div>
      </div>
   </div>
   <div class="col-md-3">
      <h2>제주도</h2>
      <div class="card">
               <img class="card-img-top" src="img/review3.jpg" alt="Card image" style="width:100%">
      
         <div class="card-body">
            <h4 class="card-title">카멜리아힐 짱조음 ㅜㅜ</h4>
               <p>제주도 카멜리아 힐을 다녀옴! 겨울이여서 추웠지만 꽃이너무이뻤고 특히 향기가 정말 좋았다ㅜㅜ </p>   
         </div>
      </div>
   </div>
   <div class="col-md-3">
      <h2>대구</h2>
      <div class="card">
               <img class="card-img-top" src="img/review4.jpg" alt="Card image" style="width:100%">
      
         <div class="card-body">
            <h4 class="card-title">망우당공원에 다녀옴</h4>
               <p>아이들하고 산책하러 잠깐나가기 좋았어요! 주변에 카페도 많아서 쉴수도있고! 일석이조!</p>   
         </div>
      </div>
   </div>
   <div class="col-md-3">
      <h2>부산</h2>
      <div class="card">
               <img class="card-img-top" src="img/review2.jpg" alt="Card image" style="width:100%">
      
         <div class="card-body">
            <h4 class="card-title">추웠던 광안리해변ㅜ</h4>
               <p>제주도 카멜리아 힐을 다녀옴! 겨울이여서 추웠지만 꽃이너무이뻤고 특히 향기가 정말 좋았다ㅜㅜ </p>   
         </div>
      </div>
   </div>
   </div>
   </div>

</body>
</html>