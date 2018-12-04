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
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
</head>
<body>
<%@ include file="form/header.jsp" %>

<div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">결제완료
					<small>예약한 상세내용과 선택한 기사님을 확인하세요</small>
					<input type="button" value="홈으로 가기" onclick="location.href='index.jsp'" class="btn btn-default" style="float:right">
                </h1>
            </div>    
            
        </div>

        <div class="row">

            <div class="col-lg-7 col-md-7">
                <a href="#">
                    <img class="img-responsive" src="img/mountains.jpeg" alt="" width="700px" height="300px">
                </a>
            </div>

            <div class="col-lg-5 col-md-5">
                <h3><b>[제주도] </b>2018년 12월 24일</h3><br>           
                <h4>1.성산일출봉</h4>
                <h4>2.동백습지</h4>
                <h4>3.새별오름 </h4>
                <h4>4.서연의 집 </h4>
                <h4>5.카멜리아힐 </h4>
                <h4>6.메이즈러너</h4><br>
                <h5>인원 : 3명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 금액 : 100000원</h5>
            </div>
        </div>
       
        <hr>
        
        <div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">내가 선택한 기사님
                    <small>해당 기사님들께 예약요청을 보냈습니다.</small>
                </h1>
            </div>

        </div>

        <div class="row">

            <div class="col-md-4 portfolio-item" align="center">
                <a href="#project-link">
                    <img class="img-responsive" src="img/td.png">
                </a>
                <h3><a>박기사</a></h3>
                <div>
                <h4><b>평점</b> :</h4>
                <span class="fa fa-star checked" style="margin-top: 8px;"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>
                </div>
                <h4><b>성별 :</b> 남자</h4>
                <h4><b>나이 :</b> 32</h4>
                <h4><b>지역 :</b> 제주도</h4>
            </div>

             <div class="col-md-4 portfolio-item" align="center">
                <a href="#project-link">
                    <img class="img-responsive" src="img/td.png">
                </a>
                <h3><a>김기사</a></h3>
                <div>
                <h4><b>평점</b> :</h4>
                <span class="fa fa-star checked" style="margin-top: 8px;"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>
                </div>
                <h4><b>성별 :</b> 남자</h4>
                <h4><b>나이 :</b> 40</h4>
                <h4><b>지역 :</b> 제주도</h4>
            </div>

             <div class="col-md-4 portfolio-item" align="center">
                <a href="#project-link">
                    <img class="img-responsive" src="img/td.png">
                </a>
                <h3><a>이기사</a></h3>
                <div>
                <h4><b>평점</b> :</h4>
                <span class="fa fa-star checked" style="margin-top: 8px;"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>
                </div>
                <h4><b>성별 :</b> 여자</h4>
                <h4><b>나이 :</b> 38</h4>
                <h4><b>지역 :</b> 제주도</h4>
            </div>

        </div>
        </div>
</div>

<%@ include file="form/footer.jsp" %>

</body>
</html>