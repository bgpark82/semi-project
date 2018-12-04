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
</head>
<body>
<%@ include file="form/header.jsp" %>
	<h1>글 쓰기</h1>
	
	<form action="RBoardController" method="post">
		<input type="hidden" name="command" value="boardwrite"/>
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="r_writer"/>
				</td>
			</tr>
			<tr>
				<th>지	역</th>
				<td>
					<input type="text" name="r_area"/>
				</td>
			</tr>
			<tr>
				<th>제	목</th>
				<td>
					<input type="text" name="r_title"/>
				</td>
			</tr>
			<tr>
				<th>내	용</th>
				<td>
					<textarea rows="10" cols="60" name="r_content"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="작성"/>
					<input type="button" value="취소" onclick="location.href='RBoardController?command=boardlist'"/>
				</td>
			</tr>
		</table>
	</form>
<%@ include file="form/footer.jsp" %>
</body>
</html>