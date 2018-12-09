


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
		var s_detail = data.scheduleDetail;
		
		var s_seq = s_detail.s_seq;
		var u_no = s_detail.u_no;
		var	d_no = s_detail.d_no;
		var s_no = s_detail.s_no;
		var s_date = s_detail.s_date;
		var s_time = s_detail.s_time;
		var s_location = s_detail.s_location;
		var s_course = s_detail.s_course;
		var s_people = s_detail.s_people;
		var s_price = s_detail.s_price;
		var s_regdate = s_detail.s_regdate;
		var s_latitude = s_detail.s_latitude;
		var s_longitude = s_detail.s_longitude;
		var s_confirmed_check = s_detail.s_confirmed_check;
		
		$("#s_location").text(s_detail.s_location);
		
		
		
		
		$("#myCal").modal();
	},
	error : function() {
		alert("상세 일정 보기 실패 fail...");
		}
	});
} 