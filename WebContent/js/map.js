var map;
var marker;
var markerList;
var markerArray = [];
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


//----------------------------------------------------------------------------------------------------------------------------------->> main

// run ajax as button selected

	$("#local").on('change',function(){
		var id = $("#local option:selected").val();
		var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=TfotMHpUdUtGCMBSV%2BBxCG7vi%2FzLocIn1xq%2FeycGAO9NFBGIz37scDa0ABTB92P8%2BaMGgmsDIKCXTcNA6zditg%3D%3D"
            +"&contentTypeId=12"
            +"&areaCode="+id 
            +"&sigunguCode=" 
            +"&cat1=&cat2=&cat3="
            +"&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A"
            +"&numOfRows=5&pageNo=1";
		
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
								$(data).find("item").each(function(i){
									var id = $(this).find("contentid").text();
									var firstimage = $(this).find("firstimage").text();
									var addr1 = $(this).find("addr1").text();
									var title = $(this).find("title").text();
									var tel = $(this).find("tel").text();
									var latitude = parseFloat($(this).find("mapy").text());
									var longitude = parseFloat($(this).find("mapx").text());
									var overview = $(this).find("overview").text();
									
									// store all of location information 
									locationInfo(id,latitude,longitude,addr1,title,tel,overview,firstimage,coordinate);
									
									 // the tour site list depending on province
									$("#trip_info").append(item(id, firstimage, title, addr1, latitude, longitude));
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
										marker = new google.maps.Marker({
									        position : {lat:latitude,lng:longitude},
									        map : map,
									        draggable: true,
									        info : item02(id, firstimage, title, addr1, tel, overview, latitude, longitude)
									    });
						
									marker.addListener('click',function(){
										infowindow.setContent(this.info);
										infowindow.open(map,this);
									})
								}
							});
					});
				// display marker of the location information on map
				})
	});
	
	// insert checked list into selected list
	function onCheck(chk){
		var id = $(chk).parent().attr("id");
		var firstimage = $(chk).next().find("img").attr("src");
		var title = $(chk).next().find("#title").text();
		var addr1 = $(chk).next().find("#addr1").text(); 
		var tel = $(chk).next().find("#tel").text();
		var latitude = parseFloat($(chk).parent().attr("data_lat"));
		var longitude = parseFloat($(chk).parent().attr("data_lng"));
		
		
		// click checkbox
		if(chk.checked){
			chk.checked = 'checked';
			$("#trip_selected").append(item(id, firstimage, title, addr1, latitude, longitude));
		}else{
			$("#trip_selected").find("#"+id).remove();
		}
		
		routeCoordinate(latitude, longitude);
			      
		// display route
		if(routeCoordinates.length > 1){
		calculateAndDisplayRoute(routeCoordinates, directionsService, new google.maps.DirectionsRenderer({map:map}));
		}
	};
	
	
	
	
	
	function displayMarker(chk){
		
		var id = $(chk).parent().attr("id");
		var firstimage = $(chk).find("img").attr("src");
		var title = $(chk).find("#title").text();
		var addr1 = $(chk).find("#addr1").text(); 
		var tel = $(chk).find("#tel").text();
		var latitude = parseFloat($(chk).parent().attr("data_lat"));
		var longitude = parseFloat($(chk).parent().attr("data_lng"));
		
		$("#trip_selected").append(item03(id, firstimage, title, addr1, latitude, longitude));
		
		routeCoordinate(latitude, longitude);
	      
		// display route
		if(routeCoordinates.length > 1){
		calculateAndDisplayRoute(routeCoordinates, directionsService, new google.maps.DirectionsRenderer({map:map}));
		}
	}
	
	
	
	function closeList(chk){
		var index = $(chk).index();

		routeCoordinates[index-1].end = null;		// array item
		routeCoordinates.splice(index,1);
		
		$(chk).remove();							// list item
		
		directionResult[index-1].setMap(null);
		directionResult.splice(index-1,1);			// directionDisplay
		responseResult.splice(index-1,1);				// response
		durationArr.splice(index-1,1);				// duration
		
		
	}
	



function item(id, firstimage, title, addr1, latitude, longitude){
	return "<li id="+id+" data_lat="+latitude+" data_lng="+longitude+">" +
			"<div onclick='displayMarker(this)' >"+
					"<img src='"+firstimage+"' width='50px' height='50px'/>"
					+"<strong><span id='title'>&nbsp;"+title+"</span></strong><br>"+
//					+"<span id='addr1'>"+addr1+"</span><br>"
			"</div><hr></li>";
}

function item02(id, firstimage, title, addr1, tel, overview, latitude, longitude){
	   return "<li id="+id+" data_lat="+latitude+" data_lng="+longitude+">" +
	   		"<div onclick='openDescription(this)'>"
	   			+"<div class='row'>" +
   					"<div class = 'col-lg-4 col-md-4'>" +
   						"<img class='img-responsive' src='"+firstimage+"' width='210' height='200'/>" +
   					"</div>"
   					+"<div class='col-lg-8 col-md-8' style='padding-left:15px'>" +
						"<h4><strong><span id='title'>"+title+"</span></strong></h4>"
						+"<h5><span id='addr1'>"+addr1+"</span></h5>"
						+"<span id='tel'>"+tel+"</span><br>" 
						+"<strong>설명 : </strong><span id='overview'>"+overview+"</span>" +
					"</div><br>"
				"</div>" +
			"</div><hr></li>";
} 

function item03(id, firstimage, title, addr1, latitude, longitude){
	return "<li id="+id+" data_lat="+latitude+" data_lng="+longitude+" onclick='closeList(this)'>" +
			"<div >"+
					"<img src='"+firstimage+"' width='50px' height='50px'/>"
					+"<strong><span id='title'>"+title+"</span></strong><br>"+
//					+"<span id='addr1'>"+addr1+"</span><br>"
			"</div><hr></li>";
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
	if(routeCoordinates.length == 0){
		routeCoordinates.push({dep:new google.maps.LatLng(latitude,longitude) , end:null});
		
	} else if(routeCoordinates.length > 0) {
		routeCoordinates[routeCoordinates.length-1].end = new google.maps.LatLng(latitude,longitude);
		routeCoordinates.push({dep:new google.maps.LatLng(latitude,longitude) , end:null});
	}
}








// calculate route
function calculateAndDisplayRoute(routeCoordinate, directionsService, directionsDisplay) {
//	var latitude_org = parseFloat($("#trip_selected li").eq(0).next().find("span").eq(3).attr("id"));
//	var longitude_org = parseFloat($("#trip_selected li").eq(0).next().find("span").eq(4).attr("id"));
    directionsService.route({									// DirectionService.route()
		origin: routeCoordinate[listSize-1].dep,
		destination: routeCoordinate[listSize-1].end,
		travelMode: 'TRANSIT'
    }, function(response, status) {								// callback -> (DirectionResult , DirectionStatus)
    	if (status === 'OK') {
    		var directionsDisplay = new google.maps.DirectionsRenderer({map:map});
    		directionsDisplay.setDirections(response);			// Direction result
    		directionResult.push(directionsDisplay);
    		responseResult.push(response);
    	
    		var distance = response.routes[0].legs[0].distance.text;
    		var duration = Math.round(Number(response.routes[0].legs[0].duration.value)/60);
    		durationArr.push(duration);
    		
    		$("#trip_selected").find("li").eq(listSize).prepend(distance);
    		$("#trip_selected").find("li").eq(listSize).prepend("<span id='duration'>"+duration+"분</span>");
    		
    		var totalDuration = 0;
    		for(var i = 0; i < durationArr.length; i++){
    			totalDuration += durationArr[i];
    		}
    		$("#totalDuration").text(Math.round((totalDuration)) +"분");
    		
    	} else {
//    		window.alert('Directions request failed due to ' + status);
    	}
    });
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






