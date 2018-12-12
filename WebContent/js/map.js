var map;
//var marker;
var markerList;
var markers = [];
var coordinate = [];
var pathCoordinates = [];
var infowindow;
var directionsService;
var listSize;							// size of list
var routeCoordinates = [];				// dep, end point									remove
var directionResult = [];				// save directionDisplay.setDirection(response)		remove
var responseResult = [];				// response from directionService.route				remove
var durationArr = [];					// durations										remove				
var countCood = 0;
var contentid = [];
var page;
var id = 1;

console.log("d " + durationArr)
console.log("routeCoordinate " +routeCoordinate);

//----------------------------------------------------------------------------------------------------------------------------------->> main

function setMarkerOnMap(map){
	for(var i = 0; i< markers.length; i++){
		markers[i].setMap(map);
	}
}


// run ajax as button selected


	function showLocation(chk){
		
		$("#trip_info").children().remove();			// 왼쪽 리스트 전부 삭제
		setMarkerOnMap(null);							// 화면의 마커 지우기
		markers = [];									// 마커를 담은 리스트 지우기
		
		id = 1;											
		
		var ac = $("#local option:selected").val();
		if($(chk).attr("id") == "left"){
			page = page - 1;
		} else if($(chk).attr("id") == "right"){
			page = page + 1;
		} else if($(chk).attr("id") == "local"){
			page = 1;
		}
		
		
		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=TfotMHpUdUtGCMBSV%2BBxCG7vi%2FzLocIn1xq%2FeycGAO9NFBGIz37scDa0ABTB92P8%2BaMGgmsDIKCXTcNA6zditg%3D%3D"
            +"&contentTypeId=12"
            +"&areaCode="+ac 
            +"&sigunguCode=" 
            +"&cat1=&cat2=&cat3="
            +"&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A"
            +"&numOfRows=7&pageNo="+ page;
		
			$.ajax({
				type : "GET",
				url : url,
				dataType : "xml"})
				// display the location information on the top of the page
				.done(function(data){
					$(data).find("item").each(function(i){
						var contentid = $(this).find("contentid").text();
						
						var url2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=TfotMHpUdUtGCMBSV%2BBxCG7vi%2FzLocIn1xq%2FeycGAO9NFBGIz37scDa0ABTB92P8%2BaMGgmsDIKCXTcNA6zditg%3D%3D"
	                           +"&contentTypeId=12" 
	                           +"&contentId="+contentid
	                           +"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y" 
	                           +"&firstImageYN=Y&areacodeYN=Y" 
	                           +"&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y" 
	                           +"&overviewYN=Y&transGuideYN=Y";
						$.ajax({
							type: "GET",
							url: url2,
							dataType: "xml"})
							.done(function(data){
								
								$(data).find("item").each(function(){
//									var id = $(this).find("contentid").text();
									
									var firstimage = $(this).find("firstimage").text();
									var addr1 = $(this).find("addr1").text();
									var title = $(this).find("title").text();
									var tel = $(this).find("tel").text();
									var latitude = parseFloat($(this).find("mapy").text());
									var longitude = parseFloat($(this).find("mapx").text());
									var overview = $(this).find("overview").text();
									
									if(firstimage == ""){
										firstimage="images/marker.png";
									}
									
									
									if(title.length > 10){
										title = title.slice(0,10).concat("...");
									}
									// store all of location information 
									locationInfo(id,latitude,longitude,addr1,title,tel,overview,firstimage,coordinate);
									
									 // the tour site list depending on province
									$("#trip_info").append(item(id, firstimage, title, addr1, latitude, longitude));
									id++;
									
								})
								
							})
							.done(function(){
								for(var cor in coordinate){
									var id = coordinate[cor].id;
									var firstimage = coordinate[cor].firstimage;
									var latitude = coordinate[cor].lat;
									var longitude = coordinate[cor].lng;
									var addr1 = coordinate[cor].addr1;
									var title = coordinate[cor].title;
									var tel = coordinate[cor].tel;
									var overview = coordinate[cor].overview;
									
										map.setCenter({lat:latitude,lng:longitude});
										var marker = new google.maps.Marker({
									        position : {lat:latitude,lng:longitude},
//									        map:map,
									        info : item02(id, firstimage, title, addr1, tel, overview, latitude, longitude)
									    });
										
						
									marker.addListener('click',function(){
										infowindow.setContent(this.info);
										infowindow.open(map,this);
									})
								}
								markers.push(marker);
								setMarkerOnMap(map);
							});
					});
				// display marker of the location information on map
				})
	};
	
	
	// 왼쪽 리스트 클릭시 1.마커선택 2.오른쪽 리스트 추가 3.경로 설정
	function displayMarker(chk){	
		var id = $(chk).parent().attr("id");
		var firstimage = $(chk).find("img").attr("src");
		var title = $(chk).find("#title").text();
		var addr1 = $(chk).find("#addr1").text(); 
		var tel = $(chk).find("#tel").text();
		var latitude = parseFloat($(chk).parent().attr("data_lat"));
		var longitude = parseFloat($(chk).parent().attr("data_lng"));
		
		// 1. 마커 선택
		infowindow.setContent(markers[id-1].info);
		infowindow.open(map,markers[id-1]);
		
		// 2. 오른쪽 리스트 추가
		$("#trip_selected").append(item03(title, latitude, longitude));
		
		// 3. 위도, 경도 값 저장
		routeCoordinate(latitude, longitude);
	      
		// 4. 경로 설정
		if(routeCoordinates.length > 1){
		calculateAndDisplayRoute(routeCoordinates, directionsService, new google.maps.DirectionsRenderer({map:map}), listSize);
		}
		
		// 5. 총 시간
		
		
	}
	
	
	
	// 마커 클릭시 1.오른쪽 리스트 추가 2.경로 설정
	function selectFromMarker(chk){
		var latitude = $(chk).attr("data_lat");
		var longitude = $(chk).attr("data_lng");
		var title = $(chk).attr("data_title");
		
		// 1. 오른쪽 리스트 추가
		$("#trip_selected").append(item03(title, latitude, longitude));
		
		// 2. 위도 경도 입력
		routeCoordinate(latitude, longitude);
	      
		// 3. 경로 설정
		if(routeCoordinates.length > 1){
		calculateAndDisplayRoute(routeCoordinates, directionsService, new google.maps.DirectionsRenderer({map:map}), listSize);
		totalDuration();
		}
		// 3. 총 시간
		
	}
	
	
	// 오른쪽 리스트에서 선택 취소 시 
	function closeList(chk){
		var index = $(chk).index();
		console.log("index : "+index);

		// 1. 선택된 인덱스의 리스트 앞의 end를 지움
		routeCoordinates[index-1].end = routeCoordinates[index].end;		// {front: o, end: x}
		routeCoordinates.splice(index,1);									// {front: x, end: x}
		
		// 2. 오른쪽 리스트의 선택된 아이템을 지움
		$(chk).remove();							// list item
		
		// 3. 취소된 지점사이의 경로를 해제
		directionResult[index-1].setMap(null);
		directionResult[index].setMap(null);
		directionResult.splice(index-1,1);			// directionDisplay
		responseResult.splice(index-1,1);			// response
		directionResult.splice(index,1);			// directionDisplay
		responseResult.splice(index,1);				// response
		console.log("1"+durationArr);
		// 4. 시간경과 배열 지움
		durationArr.splice(index-1,1);				// duration
		durationArr.splice(index,1);				// duration
		console.log("2"+durationArr);
		
		// 5. 시간경과 값 삭제
		$("#trip_selected").find("li").eq(index).find("div").eq(0).remove();
		
		
		// 6. 경로 재설정
		if(routeCoordinates.length > 1){
			calculateAndDisplayRoute(routeCoordinates, directionsService, new google.maps.DirectionsRenderer({map:map}), index);
		}
		// 7. 총 시간
		
		
	}
	



function item(id, firstimage, title, addr1, latitude, longitude){
	return "<li id="+id+" data_lat="+latitude+" data_lng="+longitude+">" +
			"<div onclick='displayMarker(this)' >"+
				"<div class='panel panel-default' style='margin-bottom:5px;>"+
					"<div class='panel-body'>"+
					"<img src='"+firstimage+"' width='50px' height='50px'/>"
					+"<span id='title'>&nbsp;"+title+"</span><br>"+
//					+"<span id='addr1'>"+addr1+"</span><br>"
			"</div></div></div></li>";
}

function item02(id, firstimage, title, addr1, tel, overview, latitude, longitude){
	   return "<li id="+id+" data_lat="+latitude+" data_lng="+longitude+">" +
	   		"<div >"
	   			+"<div class='row'>" +
   					"<div class = 'col-lg-4 col-md-4'>" +
   						"<img class='img-responsive' src='"+firstimage+"' width='210' height='200'/>" +
   					"</div>"
   					+"<div class='col-lg-8 col-md-8' style='padding-left:15px'>" +
						"<h4><strong><span id='title'>"+title+"</span></strong><button data_lat='"+latitude+"' data_lng='"+longitude+"' data_title='"+title+"' class='btn btn-default' style='float:right;' onclick='selectFromMarker(this); infowindow.close();'>선택</button></h4>"
						+"<h5><span id='addr1'>"+addr1+"</span></h5>"
						+"<span id='tel'>"+tel+"</span><br>" 
						+"<strong>설명 : </strong><span id='overview'>"+overview+"</span>" +
					"</div><br>"
				"</div>" +
			"</div><hr></li>";
} 

function item03(title, latitude, longitude){
	return "<li data_lat="+latitude+" data_lng="+longitude+" onclick='closeList(this)'>" +
			"<div class='panel panel-default' style='margin-bottom:0px;'>"+
				"<div class='panel-body' style='font-size:17px;'>"+
					"<span class='glyphicon glyphicon-map-marker' style='color:red; ' ></span>"
					+"<span id='title'>"+title+"</span><br>"+
//					+"<span id='addr1'>"+addr1+"</span><br>"
			"</div></div></li>";
}


//store the place information from tour API
function locationInfo(id, latitude, longitude, addr1,title,tel, overview, firstimage, array){
	array.push({id:id, lat:latitude, lng:longitude, addr1:addr1, title:title, tel:tel, overview:overview, firstimage:firstimage});
}


//------------------------------------------------------------------------------------------------------------------------------>> function

// show map
function initMap(){
	map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 37.49794199999999, lng: 127.02762099999995},
        zoom: 10
      });
	
	marker = new google.maps.Marker({
        position : {lat:37.49794199999999,lng:127.02762099999995},
        map : map
    });

	directionsService = new google.maps.DirectionsService;
	infowindow = new google.maps.InfoWindow();
//	showSearchBox();
}	






// route coordinate
function routeCoordinate(latitude, longitude){
	
	listSize = routeCoordinates.length;
	console.log("listsize : " +listSize);
	if(routeCoordinates.length == 0){
		routeCoordinates.push({dep:new google.maps.LatLng(latitude,longitude) , end:null});
		
	} else if(routeCoordinates.length > 0) {
		routeCoordinates[routeCoordinates.length-1].end = new google.maps.LatLng(latitude,longitude);
		routeCoordinates.push({dep:new google.maps.LatLng(latitude,longitude) , end:null});
	}
}








// calculate route
function calculateAndDisplayRoute(routeCoordinate, directionsService, directionsDisplay, num) {
    directionsService.route({									// DirectionService.route()
		origin: routeCoordinate[num-1].dep,
		destination: routeCoordinate[num-1].end,
		travelMode: 'TRANSIT'
    }, function(response, status) {								// callback -> (DirectionResult , DirectionStatus)
    	if (status === 'OK') {
    		var directionsDisplay = new google.maps.DirectionsRenderer({map:map});
    		
    		// 두 지점 사이의 경로 표시
    		directionsDisplay.setDirections(response);			// Direction result
    		directionResult.splice(num-1,0,directionsDisplay);
    		responseResult.splice(num-1,0,response);
    		
    		var distance = response.routes[0].legs[0].distance.text;
    		var duration = Math.round(Number(response.routes[0].legs[0].duration.value)/60);
    		durationArr.splice(num-1,0,duration);
    		
    		totalDuration();
    		
    		// 두 지점 사이의 예측경과시간
//    		$("#trip_selected").find("li").eq(listSize).prepend(distance);
    		$("#trip_selected").find("li").eq(num).prepend("<div style='margin-top:5px; margin-bottom:5px; color:#797979;'><span class='glyphicon glyphicon-option-vertical' style='font-size:15px;'></span>&nbsp;<span class='glyphicon glyphicon-time'></span>&nbsp;<span id='duration'>"+duration+"분</span></div>");
    		
    	} else {
//    		window.alert('Directions request failed due to ' + status);
    	}
    });
  
}



function totalDuration(){
	var totalDuration = 0;
	for(var i = 0; i < durationArr.length; i++){
		totalDuration += durationArr[i];
	}
	$("#totalDuration").text(Math.round((totalDuration)) +"분");
}








//display searchbox
function showSearchBox(){
	// place search box IN THE MAP!
 var card = document.getElementById('pac-card'); 					// container
 map.controls[google.maps.ControlPosition.TOP].push(card);			// controllers
 
 // autocomplete on input box
 var input = document.getElementById('pac-input');					// input box
 var autocomplete = new google.maps.places.Autocomplete(input);		// impose roll of autocomplete search box
 autocomplete.bindTo('bounds', map);									// bind to map
	
 //https://developers.google.com/maps/documentation/javascript/reference/places-service#PlaceResult.international_phone_number
 autocomplete.setFields(['address_components', 'geometry', 'icon', 'name','international_phone_number','opening_hours','photos','rating','reviews','website']);
 
 autocomplete.addListener('place_changed', function() {
     infowindow.close();
//     marker.setVisible(false);
     var place = autocomplete.getPlace();	// response!
     if (!place.geometry) {
       // User entered the name of a Place that was not suggested and
       // pressed the Enter key, or the Place Details request failed.
       window.alert("No details available for input: '" + place.name + "'");
       return;
     }

     // If the place has a geometry, then present it on a map.
     if (place.geometry.viewport) {
       map.fitBounds(place.geometry.viewport);
     } else {
       map.setCenter(place.geometry.location);
       map.setZoom(17);  // Why 17? Because it looks good.
     }
     
     // marker
     marker.setPosition(place.geometry.location);
     marker.setVisible(true);

     // info window
     var infowindowContent = document.getElementById('infowindow-content');
     infowindow.setContent(infowindowContent);
     var address = '';
     if (place.address_components) {
       address = [
         (place.address_components[0] && place.address_components[0].short_name || ''),
         (place.address_components[1] && place.address_components[1].short_name || ''),
         (place.address_components[2] && place.address_components[2].short_name || '')
       ].join(' ');
     }

     item()
     infowindowContent.children['place-icon'].src = place.icon;
     infowindowContent.children['place-name'].textContent = place.name;
     infowindowContent.children['place-address'].textContent = address;
     infowindow.open(map, marker);
   });	
}






// draw polyline 
//pathCoordinates.push({lat:latitude, lng:longitude});
//
//  travelPath = new google.maps.Polyline({
//    path: pathCoordinates,
//    strokeColor: '#FF0000',
//    strokeOpacity: 1.0,
//    strokeWeight: 2
//  });
//
//  travelPath.setMap(map);
//  if(directionResult.length > 0){
//	  for(var i = 0; i < directionResult.length; i++){
//		  directionResult[i].setDirections(responseResult[i]);
//	  }
//  }






