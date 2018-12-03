<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>				
<% response.setContentType("text/html; charset=UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function loginFunction(){
		$('#messageModal').modal('show');
	}
		
	</script>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">자바클래스</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="#">목록</a></li>
                <li><a href="answer.do?command=list">게시판</a></li>
                <li><a href="DriverController?command=driverlist">운전자리스트</a></li>
                <li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">회원관리<span class="caret"></span></a>
                	<ul class="dropdown-menu">
                		<li><a href="answer.do?command=signup">회원가입</a></li>
                		<li><a href="#" data-toggle="modal" data-target="#myModal">로그인</a></li>
                	</ul>
                </li>
            </ul>
        </div>
    </nav>
    
    
	
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        <div class="modal-body">
        
        	<div class="form-group">
         		<div><input class="form-control" type="text" name="userId" placeholder="아이디"></div>
				<div><input class="form-control" type="password" name="userPassword" placeholder="비밀번호"></div>
        	</div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Login</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>