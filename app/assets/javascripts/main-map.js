var myMap = myMap || {};

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

  myMap.popups = [];

  google.maps.event.addListener(marker, 'click', function(){
    popup.open(myMap.map, marker);
  });

  setTimeout(function(){
    myMap.map.setCenter(marker.getPosition());
  }, 1000);

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
        renderFlights(response);

      }
    });

  var renderFlights = function(flights) {
    flights.forEach(function(flight){

      var marker = new google.maps.Marker({ position: {lat: flight.lat, lng: flight.lng} });

      marker.setMap(myMap.map);
      marker.popup = new google.maps.InfoWindow({ content: flight.formatted_address }) // content: flight.drone.model_make});
      myMap.popups.push(marker.popup);
      setListener(marker);
    });
  };  

  function setListener(marker) {    
    google.maps.event.addListener(marker, 'click', function() {
      console.log(this);
      myMap.popups.forEach(function(popup){
        popup.close();
      });
      marker.popup.open(myMap.map, this);
    });
  }

});