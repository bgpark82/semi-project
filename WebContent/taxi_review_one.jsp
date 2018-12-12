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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!-- custom css -->
<link rel="stylesheet" type="text/css" href="css/calendar.css">
<style type="text/css">
#map {
	height: 400px;
	width: 100%;
}

.glyphicon-star{
  
  cursor: pointer;
}
.glyphicon-star.on{
	color:orange;
}

</style>
<script>
	
	function ratingModal() {
		$("#myReivew").modal();
	}
	 
	 
</script>

</head>
<body>
	<%@ include file="form/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					완료된 여행 <small>기사님의 평점과 리뷰를 작성해주세요</small> <input type="button"
						value="리뷰 쓰러가기" onclick="location.href='RBoardController?command=boardlist&u_no=${userDto.u_no }'"
						class="btn btn-default" style="float: right">
				</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-5 col-md-5">
					<input type="hidden" id="s_course" value="${dto.s_course }">
					<input type="hidden" id="s_latitude" value="${dto.s_latitude }">
					<input type="hidden" id="s_longitude" value="${dto.s_longitude }">
				<div id="map"></div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="panel panel-default" style="height: 400px">
					<div class="panel-body">
						<table class="table">
							<tr>
								<th>지역</th>
								<td>${dto.s_location }</td>
							</tr>
							<tr>
								<th>날짜</th>
								<td>${dto.s_date }</td>
							</tr>
							<tr>
								<th>인원</th>
								<td>${dto.s_people }명</td>
							</tr>
							<tr>
								<th>금액</th>
								<td>${dto.s_price }원</td>
							</tr>
							<tr>
								<th>경로</th>
								<td>${dto.s_course }</td>
							</tr>

						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 portfolio-item" align="center">
				<div class="panel panel-default" style="height: 400px">
					<div class="panel-body">
						<img class="img-responsive"
							style="width: 200px; height: 200px; border-radius: 100%;"
							src="${dto.d_profile }">
						<h3>${dto.d_name }</h3>
						<c:choose>
							<c:when test="${dto.ra_rating != 0 }">
								<c:forEach begin="1" end="${dto.ra_rating }" step="1">
									<span class="glyphicon glyphicon-star on"></span>
								</c:forEach>
								<c:forEach begin="${dto.ra_rating +1}" end="5" step="1">
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
							<b>지역 :</b> ${dto.d_region }
						</h4>
						
						<c:choose>
							<c:when test="${res == 1}">
								<button id="button" class="btn btn-default" onclick="ratingModal()" style="display:none;">평점 남기기</button>
							</c:when>
							<c:otherwise>
								<button id="button" class="btn btn-default" onclick="ratingModal()">평점 남기기</button>
							</c:otherwise>
						</c:choose>	
						
						
					</div>

				</div>
			</div>
		</div>
	</div>


	<!-- 평점 모달창 -->
	<div class="container-fluid" style="width: 400px;">
		<div class="modal fade" id="myReivew" role="dialog">
			<div class="modal-dialog" align="center">

				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" align="center">
							평점을 남겨주세요 <small>여러분들이 남긴 리뷰는 기사님에게 힘이 됩니다</small>
						</h4>
					</div>
					
					<div class="modal-body">
					
						<div class="container-fluid">
							<div class="panel panel-default" style="height: 50px">
								<div class="panel-body">
									<form action="RatingController" method="Post" id="sendStars">
									<input type="hidden" name="command" value="rating">
									<input type="hidden" name="u_no" value="${dto.u_no }">
									<input type="hidden" name="d_no" value="${dto.d_no }">
									<input type="hidden" name="s_seq" value="${dto.s_seq }">
										<div class="star" style="font-size:30px;">
											<span class="glyphicon glyphicon-star on"></span>
											<span class="glyphicon glyphicon-star"></span>
											<span class="glyphicon glyphicon-star"></span>
											<span class="glyphicon glyphicon-star"></span>
											<span class="glyphicon glyphicon-star"></span>
										</div>
									</form>		
								</div>
							</div>
						</div>
					
					</div>
					<div class="modal-footer">
						<input class="btn btn-primary right-block" data-dismiss="modal" type="button" value="확인" onclick="checkStars()"/>
					</div>
				</div>


			</div>

		</div>
	</div>

<script>
	
	$('.star span').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
	});
		
	function checkStars(){
		var count = $(".star > .on").length;
		$("#sendStars").append("<input type='hidden' name='ra_rating' value='"+count+"'>");
		$("#sendStars").submit();
	}

</script>

	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDogTL8Fk8vbPq2JCZrZKedH35rNtSGKJE&libraries=places"></script>
	<script type="text/javascript" src="js/schedule_review.js"></script>


	<%@ include file="form/footer.jsp"%>
	

</body>
</html>