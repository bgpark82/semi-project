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

	<h1>게시글 보기</h1>
	<form action="RBoardController" method="post">
		<input type="hidden" name="command" value="update"/>
		<input type="hidden" name="r_no" value="${dto.r_no }"/>	
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
				<th>지	역</th>
				<td>
					<input type="text" name="r_area" value="${dto.r_area }"/>
				</td>
			</tr>
			<tr>
				<th>제	목</th>
				<td>
				<input type="text" name="r_title" value="${dto.r_title }"/>
				</td>
			</tr>
			<tr>
				<th>내	용</th>
				<td>
				<textarea rows="10" cols="60" name="r_content">${dto.r_content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="삭제" onclick="location.href='RBoardController?command=delete&r_no=${dto.r_no}'"/>
				<input type="button" value="목록" onclick="location.href='RBoardController?command=boardlist'"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>