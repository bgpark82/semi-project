<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>				
<% response.setContentType("text/html; charset=UTF-8"); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
 <script src="https://apis.google.com/js/platform.js" async defer></script> 
 <meta name="google-signin-client_id" content="690508328531-01hp95icnlji25iomgb897khfc4vevfu.apps.googleusercontent.com">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> 
 
 


<script>
	function init(){
		gapi.load('auth2', function() { 
			window.gauth = gapi.auth2.init({
				client_id: '690508328531-01hp95icnlji25iomgb897khfc4vevfu.apps.googleusercontent.com'
			});
			gauth.then(function(){
				checkLoginStatus();
			},function(){
				alert("에러발생");
			})
		});

	}
	
	function checkLoginStatus(){
		var nameTxt = document.querySelector("#name");
		var loginBtn = document.querySelector("#loginBtn");
		if(gauth.isSignedIn.get()){
			loginBtn.value = "Logout";
			var profile = gauth.currentUser.get().getBasicProfile();
			console.log(profile.getName());
			nameTxt.innerHTML = 'Welcome <Strong>'+profile.getName()+'</strong>';
		}else{
			loginBtn.value = "Login";
			nameTxt.innerHTML = '';
		}
	}
</script>
</head>
<body>
    <nav class="navbar navbar-default" style="margin-bottom:0px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">TaxiRo</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="answer.do?command=list">게시판</a></li>
                <li><a href="DriverController?command=driverlist">운전자 리스트</a></li>
                <li><a href="taxi_best.jsp">베스트 여행지</a></li>
                <c:choose>
                	<c:when test="${userDto.u_name != null }">
                		<li><a href="taxi_calendar.jsp">일정관리</a></li>
                	</c:when>
                </c:choose>
                
                <li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">회원관리<span class="caret"></span></a>
                	<ul class="dropdown-menu">
	                	<c:choose>
							<c:when test="${userDto.u_name != null }">
								<li><a href="UserController?command=userinfo&u_no=${userDto.u_no}">마이페이지</a></li>
								<li><a href="DriverController?command=logout">로그아웃</a></li>
								<li><a href="ReviewController?command=review&u_no=${userDto.u_no }">지난 일정 보기</a></li>
							</c:when>
							<c:when test="${driverDto.d_name != null }">
								<li><a href="DriverController?command=driverinfo&d_no=${driverDto.d_no}">마이페이지</a></li>
								<li><a href="DriverController?command=logout">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="taxi_registform.jsp">회원가입</a></li>
								<li><a href="#" id="login">로그인</a></li>
								
							</c:otherwise>
						</c:choose>
                	</ul>
                </li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${userDto.u_name != null}">
						<li><a href="#"> &nbsp;<span class="glyphicon glyphicon-user"></span><span>${userDto.u_name }</span>님 반갑습니다. </a></li>	
					</c:when>
					<c:when test="${driverDto.d_name != null}">
						<li><a href="#"><img style="width:25px; height:25px; border-radius:100%;" src="${driverDto.d_profile }"/>&nbsp;<span>${driverDto.d_name }</span>님 반갑습니다. </a></li>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>              
            </ul>
        </div>
    </nav>
	
	

  <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
  <!-- Modal 내용-->
			<div class="modal-content"  style="width: 500px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" align="center">택시로 로그인</h4>
				</div>
			 
				<div class="modal-body" style="padding">
			 		<ul id="myTab" class="nav nav-tabs" role="tablist"> 
			 			<li role="presentation" class=" col-xs-6 active" style="padding-left: 0px;padding-right: 0px;">
			 			<a data-target="#사용자" id="사용자-tab" role="tab" data-toggle="tab" aria-controls="사용자" aria-expanded="true" style="text-align: center;">사용자</a></li> 
			 
			 			<li role="presentation" class="col-xs-6 deactive"style="padding-left: 0px;padding-right: 0px;">
						<a data-target="#운전자" role="tab" id="운전자-tab" data-toggle="tab" aria-controls="운전자" aria-expanded="false"style="text-align: center; margin-right: 0px;" >운전자</a></li>
					</ul>
					
					<div id="myTabContent" class="tab-content"> 
					
						<div role="tabpanel" class="tab-pane fade active in " id="사용자" aria-labelledby="사용자-tab">
					 		<form class="form-horizntal" action="UserController" method="post">
						 		<input type="hidden" name="command" value="login"/>
						      	<div class="form-group" align="center" style="margin-top: 30px">
									<input class="form-control" type="text" name="id" placeholder="아이디"  required="required" style="margin-top: 20px;width: 300px;">
							      	<input class="form-control" type="password" name="pw" placeholder="비밀번호" required="required" style="margin-top: 20px;width: 300px;">
							        <input class="btn btn-primary btn-md" style="margin: 30px 0px 0px 0px; width:300px; " type="submit" value="로그인" style="margin-top: 30px" />
							        <div class="g-signin2" data-onsuccess="onSignIn" style="margin: 15px 0px 0px 0px; width:300px; "></div>
								</div>
							</form>  
						</div>
			
						<div role="tabpanel" class="tab-pane fade" id="운전자" aria-labelledby="운전자-tab" >
							<form action="DriverController" method="post">
								<input type="hidden" name="command" value="login"/>
					      		<div class="form-group" align="center"  style="margin-top: 30px">
									<input class="form-control" type="text" name="id" placeholder="아이디"  required="required" style="margin-top: 20px;width: 300px;">
					      			<input class="form-control" type="password" name="pw" placeholder="비밀번호" required="required" style="margin-top: 20px;width: 300px;">
					      			<input class="btn btn-primary btn-md" style="margin: 30px 0px 0px 0px; width:300px; " type="submit" value="로그인" style="margin-top: 30px" />
					      			<div class="g-signin2" data-onsuccess="onSignIn" style="margin: 15px 0px 0px 0px; width:300px; "></div>
					      		</div>
							</form>   
						</div>
			
			   			<div class="modal-footer">
							<input class="btn btn-link"  type="button" value="계정이 없으신가요?"  onclick="location.href='taxi_registform.jsp'"  />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  
  <script>
  	$("#login").on('click',function(){
  		$("#myModal").modal();
  	})	
  
  </script>

</body>
</html>