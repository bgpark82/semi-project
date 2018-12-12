<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>					<!-- 요청해주는 것을 --> 
<% response.setContentType("text/html; charset=UTF-8"); %>   	<!-- 응답할 때 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="text-align:center; height:50px;">
		<ul class="pagination pagination-sm" >
	       	<li><a href="answer.do?command=list&page=1" onclick="showLocation()">&laquo;</a></li>
			<c:choose>
				<c:when test="${page > 1 }">
					<li><a href="answer.do?command=list&page=${page -1 }"><span aria-hidden="true">&lsaquo;</span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#"><span aria-hidden="true">&lsaquo;</span></a></li>
				</c:otherwise>
			</c:choose>
			
			<c:forEach begin="1" end="${totalPage }" step="1" var="i">
				<c:choose>
					<c:when test="${page == i }">
						<li class="active"><a href="answer.do?command=list&page=${i }">${i } </a></li>
					</c:when>
					<c:otherwise>
						<li ><a href="answer.do?command=list&page=${i }">${i } </a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
	       <c:choose>
		       	<c:when test="${totalPage > page }">
		       		<li><a href="answer.do?command=list&page=${page +1 }"><span aria-hidden="true">&rsaquo;</span></a></li>
		       	</c:when>
		       	<c:otherwise>
		       		<li><a href="#"><span aria-hidden="true">&rsaquo;</span></a></li>
		       	</c:otherwise>
	       </c:choose>
			<li><a href="answer.do?command=list&page=${totalPage }">&raquo;</a></li>
		</ul>
	</div>

</body>
</html>