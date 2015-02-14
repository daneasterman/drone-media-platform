var myMap = myMap || {};

myMap.initialize = function() {

  var mapOptions = {
    center: { lat:  51.52, lng: -0.115},
    zoom: 14,
    mapTypeId:google.maps.MapTypeId.ROADMAP //default
  };

  myMap.map = new google.maps.Map(myMap.mapCanvas, mapOptions);

  var markerOptions = {
    position: { lat: 51.53, lng: -0.109446 }
  };

  var marker = new google.maps.Marker(markerOptions);
  marker.setMap(myMap.map);

  var popupOptions = {
    content: "<strong>Arbitrary place location!</strong>"
  }

  var popup = new google.maps.InfoWindow(popupOptions);

  google.maps.event.addListener(marker, 'click', function(){
    popup.open(myMap.map, marker);
  });

  setTimeout(function(){
    myMap.map.setCenter(marker.getPosition());
  }, 1000);

}

$(function(){
  if ($('map-canvas').length > 0) {
    myMap.mapCanvas = $('#map-canvas')[0];
    myMap.initialize();
  }
});