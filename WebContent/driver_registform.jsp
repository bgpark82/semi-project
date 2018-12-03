<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>			 
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function idChk() {
	var doc = document.getElementsByName("d_id")[0];
	if(doc.value.trim()==""||doc.value==null){
		alert("아이디를 입력하세요.");
	
	}else{
		var target = "DriverController?command=idchk&id=" + doc.value.trim();
		open(target,"","width=500,height=500");
	}
}
	
function idChkConfirm() {
	var chk = document.getElementsByName("d_id")[0].title;
	if(chk=="n"){
		alert("아이디 중복체크를 해주세요");
		document.getElementsByName("d_id")[0].focus();
	}
}

</script>
</head>
<body>


<h1>회원가입</h1>

	<form action="DriverController" method="post">
		<input type="hidden" name="command" value="registdriver" />
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="d_id" title="n" required="required" />
					<input type="button" value="중복체크"	onclick="idChk();"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="d_pw" onclick="idChkConfirm();"
					required="required" /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="d_name" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="d_birth" onclick="idChkConfirm();" placeholder="890522" required="required" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					남자<input type="radio"	name="d_gender" value="M" onclick="idChkConfirm();" required="required" />
					여자<input type="radio"	name="d_gender" value="W" onclick="idChkConfirm();" required="required" />
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="d_phone" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="d_email" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<th>면허번호</th>
				<td><input type="text" name="d_license" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<th>차량번호</th>
				<td><input type="text" name="d_carnum" onclick="idChkConfirm();" required="required" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="가입" />
				<input type="button" value="취소" onclick="location.href='index.jsp'" />
			</td>
			</tr>
		</table>
	</form>

</body>
</html>