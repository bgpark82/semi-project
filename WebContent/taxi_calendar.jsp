<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>				
<% response.setContentType("text/html; charset=UTF-8"); %> 
<%@page import="com.taxi.schedule.dao.ScheduleDao"%>
<%@page import="com.taxi.schedule.dao.Util" %>
<%@page import="com.taxi.schedule.dto.ScheduleDto" %>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.List" %>
<%@page import="com.taxi.user.dto.UserDto" %>
<%@page import="com.taxi.schedule.dto.ScheduleDto" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 <!-- custom css -->
<link rel="stylesheet" type="text/css" href="css/calendar.css">
<style type="text/css">
#map {
	height: 400px;
	width: 100%;
}

.glyphicon-star{
  
  cursor: pointer;
}
.glyphicon-star.on{
	color:orange;
}
</style>
</head>
<body>
<%@ include file="form/header.jsp" %>

<%
	
	Calendar cal = Calendar.getInstance();

	// 1. 초기 해당 년, 월 
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	
	// 2. 브라우저에서 받은 년, 월
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	if(paramYear != null) year = Integer.parseInt(paramYear);
	if(paramMonth != null) month = Integer.parseInt(paramMonth);

	if(month > 12){
		year++;
		month =1;
	}
	
	if(month <1){
		year--;
		month = 12;
	}

	// 년도, 월, 해당 월의 1일
	cal.set(year,month-1,1);
	
	//1일의 요일 
	int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);
	
	//현재 월의 마지막일 
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int count = 0;
	
	//달력에 일정 표현
	ScheduleDao dao = new ScheduleDao();
	UserDto userDto = (UserDto)session.getAttribute("userDto");
	int u_no = userDto.getU_no();
	String yyyy_MM  = year + "-" +Util.isTwo(String.valueOf(month));
	System.out.println("yyyyMM : " + yyyy_MM);
	List<ScheduleDto> clist = dao.UserCalView(u_no, yyyy_MM);
	
%>

<br><br><h1 style="text-align:center" id="test">내 일정 보기</h1><br><hr>
<div class="container" style="margin:0 auto; width:800px;">

	<table id="UserCal" style="width:100%; height:100%" class="table table-borderless">
		<caption style="text-align:center">
			<a href="taxi_calendar.jsp?year=<%=year-1 %>&month=<%=month%>">《</a>
			<a href="taxi_calendar.jsp?month=<%=month-1 %>&year=<%=year %>">◀</a>
			<span><%=year %></span>년
			<span><%=month %></span>월
			<a href="taxi_calendar.jsp?month=<%=month+1 %>&year=<%=year %>">▶</a>
			<a href="taxi_calendar.jsp?year=<%=year+1 %>&month=<%=month %>">》</a>
		</caption>
		
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>		
		</tr>
		<tr>
		
<%
		//달력 앞에 공백
		for(int i=0 ; i < dayOfweek-1 ; i++){
			count ++;
			out.print("<td>&nbsp</td>");
		}
		
		//날짜 출력
		for(int i=1 ; i<=lastDay; i++){
%>			
		
	<td>	
	<a style="color: <%=Util.fontcolor(i, dayOfweek)%>"><%=i %></a>
	<div class="clist" id="CalDetail" ><%=Util.UserCalView(i, clist) %></div>
	</td>
	
		
<%
		if ((dayOfweek + i - 1) % 7 == 0) {
				out.print("</tr><tr>");
			}
		}
		
		for (int i = 0; i < (7 - (dayOfweek + lastDay - 1) % 7) % 7; i++) {
			out.print("<td>&nbsp;</td>");
		}
%>			
	</table>
</div>



<!--  일정 모달창 -->
   <div class="container-fluid" style="width:100%">
      <div class="modal fade" id="myCal" role="dialog" >
         <div class="modal-dialog modal-lg" align="center">

            <div class="modal-content" >

               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title" align="center">세부일정 <small>예약한 상세내용과 선택한 기사님을 확인하세요</small></h4>
               </div>

               <div class="modal-body">
                  
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-5 col-md-5">
							<div id="map"></div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="panel panel-default" style="height: 300px">
								<div class="panel-body">
									<table class="table">
										<tr>
											<th>지역</th>
											<td id="s_location"></td>
										</tr>
										<tr>
											<th>날짜</th>
											<td id="s_date"></td>
										</tr>
										<tr>
											<th>인원</th>
											<td id="s_people"></td>
										</tr>
										<tr>
											<th>금액</th>
											<td id="s_price"></td>
										</tr>
										<tr>
											<th>경로</th>
											<td id="s_course"></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-3 portfolio-item" align="center">
							
								<div class="panel panel-default" style="height:80%">
									<div class="panel-body">
										<img class="img-responsive"
											style="width: 200px; height: 200px; border-radius: 100%;"
											src="images/icon.jpg">
										<h3></h3>
											<div id="star"></div>
										<h4>
											<b id="d_gender"></b><span></span>
										</h4>
										<h4>
											<b id="d_location"></b>
										</h4>
										<div id="s_confirmed_check"></div>
									</div>
								</div>
						</div>
					</div>
				</div>
				
               </div>

               <div class="modal-footer">
                  <input class="btn btn-primary right-block" data-dismiss="modal"
                     type="button" value="확인" />
               </div>
            </div>

         </div>
      </div>
   </div>

<script type="text/javascript" src="js/schedule_detail.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDogTL8Fk8vbPq2JCZrZKedH35rNtSGKJE&libraries=places"></script>
<!-- <script type="text/javascript" src="js/schedule.js"></script> -->

<%@ include file="form/footer.jsp" %>

</body>
</html>