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

onload=function(){
	var id = opener.document.getElementsByName("d_id")[0].value;
	document.getElementsByName("id")[0].value = id;
}

function confirm(bool){
	if(bool=="true"){
		opener.document.getElementsByName("d_pw")[0].focus();
		opener.document.getElementsByName("d_id")[0].title="y";
	}else{
		opener.document.getElementsByName("d_id")[0].focus();
	}
	self.close();
}


</script>

<%
	String idnotused = request.getParameter("idnotused");
%>
</head>
<body>

	<table>
		<tr>
			<td>
				<input type="text" name="id">
			</td>
		</tr>
		<tr>
			<td>
				<%=idnotused.equals("true")?"아이디 생성 가능":"중복 아이디 존재" %>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirm('<%=idnotused %>');"/>
			</td>
		</tr>
		
	</table>





</body>
</html>


