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
th{width: 40%; text-align: center;}
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
<div class="container" style="margin:10;">

	
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
   <div class="container-fluid row">
      <div class="modal fade" id="myCal" role="dialog">
         <div class="modal-dialog" align="center">

            <div class="modal-content" style="width: 300px;">

               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title" align="center">내 상세 일정</h4>
               </div>

               <div class="modal-body">
                  
                  <table class="table table-hover" style="border-bottom: 1px solid #DDDDDD">

                     <tbody>
                        <tr>
                           <th>번호</th>
                           <td id="s_location"></td>
                           
                        </tr>
                        <tr>
                           <th>아이디</th>
                           <td></td>
                        </tr>                        
                        <tr>
                           <th>제목</th>
                           <td></td>
                        </tr>
                        <tr>
                           <th>내용</th>
                           <td></td>
                        </tr>      
                        <tr>
                           <th>일정</th>
                           <td></td>
                        </tr>
                        <tr>
                           <th>작성날짜</th>
                           <td></td>
                        </tr>               
                     </tbody>
                  </table>
               </div>

               <div class="modal-footer">
                  <input class="btn btn-primary right-block" data-dismiss="modal"
                     type="button" value="확인" />
               </div>
            </div>

         </div>
      </div>
   </div>



<script type="text/javascript">

	//날짜 클릭시 캘린더 밑에 일정 상세보기 
	 function scheduleDetail(chk){
		$.ajax({
			type : "POST",
			url : "ScheduleController", //server와 통신 
			data : {
				command : "scheduleDetail",
				s_seq : $(chk).attr("id")
			},
			dataType : "json", //받는 데이터 속성
			success : function(data) { //data는 받아온 데이터값들?
				var detail = data.scheduleDetail;
				$("#s_location").text(detail.s_location);
				 $("#myCal").modal();
	
			},
			error : function() {
				alert("상세 일정 보기 실패 fail...");
			}
		});
	} 
	
	
	
	
</script>








<%@ include file="form/footer.jsp" %>

</body>
</html>