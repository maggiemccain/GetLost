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
        var infoWindows = [];
        var getLostTo;
        var startPos;



        $(document).ready(function() {

        });

        $.ajax({
            type: "GET",
            url:"api/events"
          }).done(
            function(response) {
              eventMarkers = response.map(function(evt) {
                return {name: evt.event_name, hobby: evt.hobby_name, latLng: {lat: evt.latitude, lng: evt.longitude}}
              });
                console.log(eventMarkers);
                loadMarkers(eventMarkers);
          });


        function initMap() {
          //default center location when geolocation is not available
          var melb = {lat: -37.8136, lng: 144.9631};//-37.8136, 144.9631
          var geelong = {lat: -37.8136, lng: 143.9631};
          //Store all added events, later get from ajax
          // eventMarkers.push(melb);
          // eventMarkers.push(geelong);//for testing

          map = new google.maps.Map($('#map')[0], {
            zoom: 10,
            center: melb,
            mapTypeId: 'terrain'
          });

          // HTML 5 geolocation
          locateUser();

          // This event listener will call addMarker() when the map is clicked.
          map.addListener('click', function(event) {
            getLostTo = event.latLng.toJSON();
            //plotMarker(event.latLng);
            plotMarker(getLostTo);
            console.log(getLostTo);
          });

          // Adds a marker at the center of the map.
          loadMarkers(eventMarkers);
        }


        //Let user drop a "pin"
        function plotMarker(location) {
          clearMarkers();
          closeInfoWindows(infoWindows);
          var marker = addMarker(location);

          // infoWindow.setPosition(event.latLng);


          marker.addListener('click', function(event) {
            // var infoWindow = new google.maps.InfoWindow({map: map, pixelOffset: new google.maps.Size(0, -25)});
            // infoWindow.setPosition(event.latLng);
            // infoWindow.setContent("<button>Explore</button><button class='create'>Create Event</button>");
            var infoWindow = new google.maps.InfoWindow({map: map, pixelOffset: new google.maps.Size(0, 10)});
            infoWindow.setContent("<button class='expl'>Explore</button><a href='/events/new?lat=" + getLostTo.lat +
            "&lng=" + getLostTo.lng + "'>Create</a>");
            $('.popUpBtn').on('click', function(){

              console.log(event.latLng.toJSON().lat + "button");
              location.href = "/events/new?lat=" + event.latLng.toJSON().lat + "lng=" + event.latLng.toJSON().lng;

            });
            infoWindow.open(map, marker);
            map.setCenter(event.latLng);
            infoWindows.push(infoWindow);

          });
          markers.shift();
          markers.push(marker);
        }

        //load all event markers
        function loadMarkers(locationArr) {
          locationArr.forEach(function(loc){
            var marker = addMarker(loc.latLng);
            var popupContent = "<div class='EventInfoWindow'><div class='e_name'>" + loc.name +
            "</div><div class='hobby'>" + loc.hobby + "</div><div><a href='abc'>Bookmark This Event</a></div></div>";
            var infoWindow = new google.maps.InfoWindow({content: popupContent, pixelOffset: new google.maps.Size(0, 10)});
            infoWindows.push(infoWindow);
            marker.addListener('click', function(event) {
              // var infoWindow = new google.maps.InfoWindow({map: map, position: loc.latLng, pixelOffset: new google.maps.Size(0, -25)});
              // infoWindow.setPosition(loc.latLng);
              infoWindow.open(map, marker);
              // infoWindow.setContent('<div></div><button>Click here!</button>');
              // map.setCenter(getLostTo);
            });
          });
        }

        function addMarker(location) {
          //Add a marker on map
          var marker = new google.maps.Marker({
            position: location,
            map: map
          });
          return marker;
        }

        function closeInfoWindows(windowArr){
          if(windowArr !== []){
            windowArr.forEach(function(w){
              $('.EventInfoWindow').remove();
              w.close();
            });
          }
        }

        function addInfoWindow(){

        }

        //--------Geoloaction-------
        function locateUser(){
          //Retrieve users's current pos via googe map api
          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
              var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
              };
              console.log('Location found.');
              map.setCenter(pos);

              var marker = addMarker(pos);


            }, function() {
              handleLocationError(true);
            });
          } else {
            // Browser doesn't support Geolocation
            handleLocationError(false);
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
        function handleLocationError(browserHasGeolocation) {
        console.log(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        }
