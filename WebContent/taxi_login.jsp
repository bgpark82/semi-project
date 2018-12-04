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


<form action="UserController" method="post">
   <input type="hidden" name="command" value="login"/>
   <table border="1">
      <col width="100" />
      <col width="100" />
      <h1>user로그인</h1>
      <tr>
         <th>I D : </th>
         <td><input type="text" name="id" /></td>
      </tr>
      <tr>
         <th>P W : </th>
         <td><input type="text" name="pw" /></td>
      </tr>
      <tr>
         <td colspan="2">
            <input type="submit" value="login" />
         </td>
      </tr>
   </table>
</form>
      
<form action="DriverController" method="post">
   <input type="hidden" name="command" value="login"/>
   <table border="1">
      <col width="100" />
      <col width="100" />
      <h1>driver로그인</h1>
      <tr>
         <th>I D : </th>
         <td><input type="text" name="id" /></td>
      </tr>
      <tr>
         <th>P W : </th>
         <td><input type="text" name="pw" /></td>
      </tr>
      <tr>
         <td colspan="2">
            <input type="submit" value="login" />
      
         </td>
      </tr>
   </table>
</form>




</body>
</html>