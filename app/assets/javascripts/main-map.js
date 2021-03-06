var myMap = myMap || {};

myMap.popups = [];

myMap.initialize = function() {

  var mapOptions = {
    zoom: 2,
    mapTypeId:google.maps.MapTypeId.ROADMAP //default
  };

  myMap.map = new google.maps.Map(myMap.mapCanvas, mapOptions);

  var markerOptions = {
    position: { lat: 51.53, lng: -0.109446 }
  };

  var marker = new google.maps.Marker(markerOptions);
  marker.setMap(myMap.map);

  // var popupOptions = {
  //   content: "<strong>Arbitrary place location!</strong>"
  // }

  // var popup = new google.maps.InfoWindow(popupOptions);


  google.maps.event.addListener(marker, 'click', function(){
    popup.open(myMap.map, marker);
  });

  setTimeout(function(){
    myMap.map.setCenter(marker.getPosition());
  }, 1000);

}

 myMap.renderFlights = function(flights) {
  flights.forEach(function(flight){

    var marker = new google.maps.Marker({ position: {lat: flight.lat, lng: flight.lng} });

  console.log(flight)

    marker.setMap(myMap.map);
    marker.popup = new google.maps.InfoWindow({ content: flight.formatted_address })
    marker.popup.setContent("<div id='popupcontent'><a href='" + flight.id + "'><strong>" + flight.formatted_address + "</strong><br/></div>");
    myMap.popups.push(marker.popup);
    myMap.setListener(marker);
  });
};
// myMap.popup.setContent("<div id='popupcontent'><a href='" + flight.id + "'><strong>" + flight.formatted_address + "</strong><br/>" + flight.drone + "<br/>" + flight.camera + "</a></div>");

 myMap.setListener = function(marker) {    
  google.maps.event.addListener(marker, 'click', function() {
    console.log(this);
    myMap.popups.forEach(function(popup){
      popup.close();
    });

    marker.popup.open(myMap.map, this);
  });
}




$(function(){
  if ($('#map-canvas').length > 0) {
    myMap.mapCanvas = $('#map-canvas')[0];
    myMap.initialize();
  }

  var data = []

  $.ajax({
      type: "GET",
      url: "/flights",
      data: data,
      dataType: 'json',
      success: function(response){
        console.log(response);
        myMap.renderFlights(response);

      }
    }); 

});