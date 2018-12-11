var s_course
var s_latitude
var s_longitude
//날짜 클릭시 캘린더 밑에 일정 상세보기 
 function scheduleDetail(chk){
	
	$.ajax({
		type : "POST",
		url : "ScheduleController",  
		data : {
		command : "scheduleDetail",
		s_seq : $(chk).attr("id")
	},
	dataType : "json"}) 				
	.done(function(data) { 		
		var s_detail = data.scheduleDetail;
		console.log(s_detail);
		var s_seq = s_detail.s_seq;
		var u_no = s_detail.u_no;
		var	d_no = s_detail.d_no;
		var	d_name = s_detail.d_name;
		var d_profile = s_detail.d_profile;
		var s_no = s_detail.s_no;
		var s_date = s_detail.s_date;
		var s_time = s_detail.s_time;
		var s_location = s_detail.s_location;
		s_course = s_detail.s_course;
		var s_people = s_detail.s_people;
		var s_price = s_detail.s_price;
		var s_regdate = s_detail.s_regdate;
		s_latitude = s_detail.s_latitude;
		s_longitude = s_detail.s_longitude;
		var d_gender = s_detail.d_gender;
		var s_location = s_detail.s_location;
		var s_confirmed_check = s_detail.s_confirmed_check;
		var ra_rating = s_detail.ra_rating;
		
		
		
		$("#s_location").text(s_location);
		$("#s_date").text(s_date);
		$("#s_people").text(s_people);
		$("#s_price").text(s_price);
		$("#s_course").text(s_course);
		$("#d_name").text(d_name);
		$("#d_gender").text(d_gender);
		
		$("#profile").attr("src",d_profile);
		

		
		if(s_confirmed_check == 'Y'){
			$("#s_confirmed_check").html('<span style="color:green; font-size:40px;" class="glyphicon glyphicon-ok"></span>');
		} else if(s_confirmed_check == 'N'){
			$("#s_confirmed_check").html('<span style="color:red; font-size:40px; " class="glyphicon glyphicon-remove"></span>');
		} else {
			$("#s_confirmed_check").html('<span style="color:orange; font-size:40px;" class="glyphicon glyphicon-time"></span>');
		}
		
		console.log(ra_rating);
		$("#star").children().remove();
		
		if(ra_rating != 0){
			for(var i = 0; i < ra_rating; i++){
				$("#star").append('<span class="glyphicon glyphicon-star on"></span>');
			}
			for(var i = ra_rating+1; i <=5; i++){
				$("#star").append('<span class="glyphicon glyphicon-star"></span>');
			}
		} else {
			for(var i =1; i <=5; i++){
				$("#star").append('<span class="glyphicon glyphicon-star"></span>');
			}
		}
		
	
		
		
	})
	.done(function(){
		$.ajax({
		type:"POST",
		url: "ScheduleController",
		data:{
			command : "scheduleMap",
			s_course : s_course,	
			s_latitude : s_latitude,
			s_longitude : s_longitude
		},
		dataType: "json"
	})
	.done(function(data){
		initMap(data);
		map.setCenter({lat:parseFloat(data.s_latitude[0]), lng: parseFloat(data.s_longitude[0])});
		map.setZoom(10);
	})
	.done(function(data){
		var course = data.s_course;
		var latitude = data.s_latitude;
		var longitude = data.s_longitude;
		
		
		for(var i = 0; i < data.s_latitude.length; i++){
			marker = new google.maps.Marker({
				position : {lat:parseFloat(latitude[i]), lng: parseFloat(longitude[i])},
				map:map,
				info:course[i]
			});
			
			marker.addListener('click',function(){
				infowindow.setContent(this.info);
				infowindow.open(map,this);
			});
		}		
	})
	})
	.done(function(){
		$("#myCal").modal();
	});
} 
 
 function initMap(){
		map = new google.maps.Map(document.getElementById('map'));
		marker = new google.maps.Marker();
		directionsService = new google.maps.DirectionsService;
		infowindow = new google.maps.InfoWindow();
	} 