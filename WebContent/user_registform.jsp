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
<script type="text/javascript">
	function idChk(){
		var doc = document.getElementsByName("u_id")[0].value;
		if(doc.trim()==""||doc==null){
			alert("아이디를 입력해 주세요")
		}else{
			var target = "UserController?command=idchk&id=" + doc.trim();
			open(target,"","width=300, height=200");
		}
	}
	
	function idChkConfirm(){
		/* alert($("input").prop("tagName"));
		if($("input").prop("title") == 'n'){
			alert("아이디를 입력해주세요"); */
		/* } */
	}

</script>

</head>
<body>
<%@ include file="form/header.jsp" %>
	<h1>회원가입</h1>
	
	<form action="UserController" method="post">
	<input type="hidden" name="command" value="regist" /> 
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="u_id" title="n" required="required" />
					<input type="button" value="중복체크" onclick="idChk();"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="u_pw" onclick="idChkConfirm();" required="required"/>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="u_name" onclick="idChkConfirm();" required="required"/>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="u_birth" onclick="idChkConfirm();" placeholder="890522" required="required"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					남자<input type="radio" name="u_gender" value="M" onclick="idChkConfirm();" required="required"/>
					여자<input type="radio" name="u_gender" value="W" onclick="idChkConfirm();" required="required"/>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<select name="u_phone0" onclick="idChkConfirm();" required="required">
						<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
					</select>
					<input type="text" name="u_phone1" onclick="idChkConfirm();" required="required"/>
					<input type="text" name="u_phone2" onclick="idChkConfirm();" required="required"/>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="u_email" onclick="idChkConfirm();" required="required"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입"/>
					<input type="button" value="취소" onclick="location.href='index.jsp'"/>
				</td>
			</tr>
		</table>
	
	</form>
<%@ include file="form/footer.jsp" %>
</body>
</html>