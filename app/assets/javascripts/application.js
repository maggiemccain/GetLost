// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


        // In the following example, markers appear when the user clicks on the map.
        // The markers are stored in an array.
        // The user can then click an option to hide, show or delete the markers.
        var map;
        var markers = [];
        var eventMarkers = [];
        var getLostTo;
        var startPos;

        function initMap() {
          //default center location when geolocation is not available
          var melb = {lat: -37.8136, lng: 144.9631};//-37.8136, 144.9631
          var geelong = {lat: -37.8136, lng: 143.9631};
          //Store all added events, later get from ajax
          eventMarkers.push(melb);
          eventMarkers.push(geelong);//for testing

          map = new google.maps.Map($('#map')[0], {
            zoom: 12,
            center: melb,
            mapTypeId: 'terrain'
          });

          // HTML 5 geolocation
          locateUser();

          // This event listener will call addMarker() when the map is clicked.
          map.addListener('click', function(event) {
            getLostTo = event.latLng.toJSON();
            addMarker(event.latLng);
            console.log(getLostTo);
          });

          // Adds a marker at the center of the map.
          loadMarkers(eventMarkers);
        }

        // Adds a marker to the map and push to the array.
        function addMarker(location) {
          clearMarkers();
          var marker = new google.maps.Marker({
            position: location,
            map: map
          });
          markers.shift();
          markers.push(marker);
        }

        //load all event markers
        function loadMarkers(locationArr) {
          locationArr.forEach(function(loc){
            var marker = new google.maps.Marker({
              position: loc,
              map: map
            });
          });
        }

        //--------Geoloaction-------

        function flagUser(location) {
          //Add a marker on map to notify user's current pos
          var marker = new google.maps.Marker({
            position: location,
            map: map
          });
        }


        function locateUser(){
          //Retrieve users's current pos via googe map api
          var infoWindow = new google.maps.InfoWindow({map: map});

          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
              var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
              };
              infoWindow.setPosition(pos);
              infoWindow.setContent('Location found.');
              map.setCenter(pos);

              var marker = flagUser(pos);


            }, function() {
              handleLocationError(true, infoWindow, map.getCenter());
            });
          } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
          }
        }



        // Sets the map on all markers in the array.
        function setMapOnAll(map) {
          for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
          }
        }

        // Removes the markers from the map, but keeps them in the array.
        function clearMarkers() {
          setMapOnAll(null);
        }

        //Pop error message if geolocation not available
        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        }


        // Shows any markers currently in the array.
        function showMarkers() {
          setMapOnAll(map);
        }

        // Deletes all markers in the array by removing references to them.
        function deleteMarkers() {
          clearMarkers();
          markers = [];
        }
