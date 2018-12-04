var map;
var marker;
var markerList;
var markerArray = [];
var coordinate = [];
var pathCoordinates = [];
var directionResult = [];				// save directionDisplay.setDirection(response)
var responseResult = [];				// response from directionService.route
var infowindow;
var directionsService;
var routeCoordinates = [];
var durationArr = [];
var totalDuration = 0;
var count = 0;
var countCood = 0;
var contentid = [];

//-------------------------------------------------------------------------------------------------------------------------------------------------->> main

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
//        marker.setVisible(false);
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



// run ajax as button selected
$(function() {
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
									var id = i;
									var firstimage = $(this).find("firstimage").text();
									var addr1 = $(this).find("addr1").text();
									var title = $(this).find("title").text();
									var tel = $(this).find("tel").text();
									var latitude = parseFloat($(this).find("mapy").text());
									var longitude = parseFloat($(this).find("mapx").text());
									var overview = $(this).find("overview").text();
									storeCoordi(id,latitude,longitude,addr1,title,tel,overview,coordinate);
									
									 // the tour site list depending on province
									$("#trip_info").append(item(id,title,addr1,tel,latitude,longitude));
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
									        info : item(id,firstimage,title,addr1,tel,latitude,longitude)
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
});


//item detail
function item(id, title, addr1, tel, latitude, longitude){
	return "<li id="+id+"><input type='checkbox' name='here' onclick='onCheck(this)'/><a href='#' onclick='openDescription(this)'><div><strong>주소</strong> : <span id='addr1'>"+addr1+"</span><br>"
	+"<strong>관광지이름</strong> : <span id='title'>"+title+"</span><br>"
	+"<strong>전화번호</strong> : <span id='tel'>"+tel+"</span><br>" 
	+"<span id="+latitude+"></span><span id="+longitude+"></span></div></a><hr></li>";
}
//
//function item(id, firstimage, title, addr1, latitude, longitude){
//	   return "<li id="+id+"><input type='checkbox' name='here' onclick='onCheck(this)'/><a href='#' onclick='openDescription(this)'>"
//	   +"<div><img src='"+firstimage+"' width='200' height='150'/><br>"
//	   +"<strong><span id='title'>"+title+"</span></strong><br>"
//	   +"<span id='addr1'>"+addr1+"</span><br>"
//	   +"<span id="+latitude+"></span><span id="+longitude+"></span>";
//	   +"</div></a><hr></li>";
//	}
//
//function item02(id, firstimage, title, addr1, tel, overview, latitude, longitude){
//	   return "<li id="+id+"><input type='checkbox' name='here' onclick='onCheck(this)'/><a href='#' onclick='openDescription(this)'>"
//	   +"<div class='row'><div class = 'col-lg-4 col-md-4'><img class='img-responsive' src='"+firstimage+"' width='210' height='200'/></div>"
//	   +"<div class='col-lg-8 col-md-8'><h4><strong><span id='title'>"+title+"</span></strong></h4>"
//	   +"<h5><span id='addr1'>"+addr1+"</span></h5>"
//	   //+"<strong>전화번호</strong> : <span id='tel'>"+tel+"</span><br>" 
//	   +"<strong>설명 : </strong><span id='overview'>"+overview+"</span></div><br>"
//	   +"<span id="+latitude+"></span><span id="+longitude+"></span></a><hr></div></li>";
//	} 



//-------------------------------------------------------------------------------------------------------------------------------------------------->> function

//store the place information from tour API
function storeCoordi(id, latitude, longitude, addr1,title,tel, overview, array){
	array.push({id:id, lat:latitude, lng:longitude, addr1:addr1, title:title, tel:tel, overview:overview});
}


// delete a item in the selected list
$("#trip_selected").on('click','li',function(){
//	$("#trip-info").find("#"+$(this).attr("id")).first().prop('checked',false);
	var id = $(this).attr("id");	//----------------------------------------------------------------------------->   Uncheck function
//	alert($("#trip-info").find("#"+$(this).attr("id")).prop("tagName"));
	$("#trip-info").find("#"+$(this).attr("id")).first().attr("checked","");
	$(this).remove();
});
		

// insert checked list into selected list
function onCheck(chk){
	var id = $(chk).parent().attr("id");
	var title = $(chk).next().find("#title").text();
	var addr1 = $(chk).next().find("#addr1").text(); 
	var tel = $(chk).next().find("#tel").text();
	var latitude = parseFloat($(chk).next().find("span").eq(3).attr("id"));
	var longitude = parseFloat($(chk).next().find("span").eq(4).attr("id"));
	
	// click checkbox
	if(chk.checked){
		chk.checked = 'checked';
		$("#trip_selected").append(item(id,title,addr1,tel,latitude,longitude));
	}else{
		$("#trip_selected").find("#"+id).remove();
	}
	
	routeCoordinate(latitude, longitude);
	
	

      
	// display route
	if(routeCoordinates.length > 1){
	calculateAndDisplayRoute(routeCoordinates, directionsService, new google.maps.DirectionsRenderer({map:map}));
	}
};




// route coordinate
function routeCoordinate(latitude, longitude){
	if(routeCoordinates.length == 0){
		routeCoordinates.push({dep:new google.maps.LatLng(latitude,longitude) , end:null});
		count++;
	} else if(routeCoordinates.length > 0 && count > 0) {
		routeCoordinates[count-1].end = new google.maps.LatLng(latitude,longitude);
		routeCoordinates.push({dep:new google.maps.LatLng(latitude,longitude) , end:null});
		count++;
	}
}








// calculate route
function calculateAndDisplayRoute(routeCoordinate, directionsService, directionsDisplay) {
//	var latitude_org = parseFloat($("#trip_selected li").eq(0).next().find("span").eq(3).attr("id"));
//	var longitude_org = parseFloat($("#trip_selected li").eq(0).next().find("span").eq(4).attr("id"));
    directionsService.route({									// DirectionService.route()
		origin: routeCoordinate[countCood].dep,
		destination: routeCoordinate[countCood].end,
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
    		
    		$("#trip_selected").find("li").eq(countCood).append(distance);
    		$("#trip_selected").find("li").eq(countCood).append("<span id='duration'>"+duration+"분</span>");
    		
    		for(var i = 0; i < durationArr.length; i++){
    			totalDuration += durationArr[i];
    		}
    		
    		$("#totalDuration").text(Math.round((totalDuration)) +"분");
    		
    		countCood++;
    	} else {
    		window.alert('Directions request failed due to ' + status);
    	}
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






