<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

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
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>
<%@ include file="form/header.jsp" %>
	

	<div class="container">
		<h1>운전자정보조회리스트</h1>
		<ul class="list-group">
			<c:choose>
				<c:when test="${empty list }">
					<li class="list-group-item">
						-------작성된 글이 없습니다.
					</li>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list }">
						<li class="list-group-item">
							<a href="DriverController?command=driverinfo&seq=${dto.d_no}">${dto.d_name }</a></td>
							${dto.d_birth }
							${dto.d_gender }
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
		<button onclick="location.href='route_payment.jsp'" style="float:right" class="btn btn-default">결제</button>
	</div>
<%@ include file="form/footer.jsp" %>

</body>
</html>





















