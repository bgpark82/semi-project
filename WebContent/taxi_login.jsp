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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>
<body>

<div class="container">
  Modal
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
  Modal 내용
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
									<input class="form-control" type="text" name="id" placeholder="아이디" title="n" required="required" style="margin-top: 20px;width: 300px;">
							      	<input class="form-control" type="password" name="pw" placeholder="비밀번호" required="required" style="margin-top: 20px;width: 300px;">
							        <input class="btn btn-primary btn-md" style="margin: 30px 0px 30px 0px; width:300px; " type="submit" value="로그인" style="margin-top: 30px" />
								</div>
							</form>  
						</div>
			
						<div role="tabpanel" class="tab-pane fade" id="운전자" aria-labelledby="운전자-tab" >
							<form action="DriverController" method="post">
								<input type="hidden" name="command" value="login"/>
					      		<div class="form-group" align="center"  style="margin-top: 30px">
									<input class="form-control" type="text" name="id" placeholder="아이디" title="n" required="required" style="margin-top: 20px;width: 300px;">
					      			<input class="form-control" type="password" name="pw" placeholder="비밀번호" required="required" style="margin-top: 20px;width: 300px;">
					      			<input class="btn btn-primary btn-md" style="margin: 30px 0px 30px 0px; width:300px; " type="submit" value="로그인" style="margin-top: 30px" />
					      		</div>
							</form>   
						</div>
			
			   			<div class="modal-footer">
							<input class="btn btn-link"  type="button" value="계정이 없으신가요?"  onclick="DriverRegistForm();"  />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">로그인</button> -->

   
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