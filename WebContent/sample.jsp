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
<link rel="stylesheet" href="css/timeline.css">
</head>
<body>
	<%@ include file="form/header.jsp"%>





	<div class="container">

		<ul class="timeline">

			<li>
				<div class="container row">
					<div class="col-xs-2"></div>
					<div class="col-xs-10 text-muted">
						<span class="glyphicon glyphicon-time"></span> 12<span></span>시간
						소요
					</div>
				</div>
			</li>
			<li id="+id+" class="timeline-inverted">
				<div class="timeline-badge">
					<i class="glyphicon glyphicon-road"></i>
				</div>
				<div class="timeline-panel">
					<div class="timeline-body row">
						<div class="content col-xs-10">
							<div>
								<strong>주소</strong> : <span id='addr1'>"+addr1+"</span><br>"
								+"<strong>관광지이름</strong> : <span id='title'>"+title+"</span><br>"
								+"<strong>전화번호</strong> : <span id='tel'>"+tel+"</span><br>"
								+"<span id="+latitude+"></span><span id="+longitude+"></span>
							</div>
						</div>
						<div class="content col-xs-2">
							<input type='checkbox' name='here' onclick='onCheck(this)' style="width: 20px; height: 20px" />
						</div>
					</div>
				</div>
			</li>


		</ul>
	</div>






	<%@ include file="form/footer.jsp"%>

</body>
</html>