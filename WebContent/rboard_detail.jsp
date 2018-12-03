<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
	<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>상세 글 보기</h1>

	<table>
		<tr>
			<th>번호</th>
			<td>${dto.r_no }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.r_writer }</td>
		</tr>
		<tr>
			<th>제	목</th>
			<td>${dto.r_title }</td>
		</tr>
		<tr>
			<th>내	용</th>
			<td>${dto.r_content }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='RBoardController?command=updateform&r_no=${dto.r_no}'"/>
				<input type="button" value="삭제" onclick="location.href='RBoardController?command=delete&r_no=${dto.r_no}'"/>
				<input type="button" value="목록" onclick="location.href='RBoardController?command=boardlist'"/>
			
			</td>
		</tr>	
	</table>
</body>
</html>