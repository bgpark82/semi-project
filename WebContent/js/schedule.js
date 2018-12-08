var map;
var marker; 
var directionService;
var infowindow;



$(function(){
	$.ajax({
		type:"POST",
		url: "ScheduleController",
		data:{
			command : "scheduleMap"
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
		console.log(latitude);
		
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

function initMap(){
	map = new google.maps.Map(document.getElementById('map'));
	marker = new google.maps.Marker();
	directionsService = new google.maps.DirectionsService;
	infowindow = new google.maps.InfoWindow();
}