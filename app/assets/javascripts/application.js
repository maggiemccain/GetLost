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
        var geocoder;
        var currentLoc;
        var markers = [];
        var eventMarkers = [];
        var infoWindows = [];
        var getLostTo;
        var startPos;


        function initMap() {
          //default center location when geolocation is not available
          var melb = {lat: -37.8136, lng: 144.9631};//-37.8136, 144.9631
          var geelong = {lat: -37.8136, lng: 143.9631};
          geocoder = new google.maps.Geocoder;
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
            plotMarker(getLostTo);
            console.log(getLostTo);
            console.log(markers[0].getPosition().lat());
          });

        }


        // setInterval(function(){
        //   api_request_events("/api/events", {lat: getLostTo.lat, lng: getLostTo.lng, radius: 20, recent: false})
        // }, 1000);

        function api_request_events(route, args) {
          // request events from db and plot markers on map
          var events;
          $.ajax({
              type: "GET",
              url:route,
              data: args
            }).done(
              function(response) {
                events = response.map(function(evt) {
                  return {listing: evt.listing, sport: evt.sport, icon: evt.hobby_image_url, latLng: {lat: evt.latitude, lng: evt.longitude}}
                });
                  console.log(events);
                  loadMarkers(events);
            });
            return events;
        }



        //--------Geoloaction-------
        function locateUser(){
          //Retrieve users's current pos via googe map api
          var pos;
          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
              pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
              };
              console.log('Location found.');
              map.setCenter(pos);
              console.log(pos);
              currentLoc = pos;
              var marker = dropMarker([pos]);
              // add event markers around user's current location
              eventMarkers = api_request_events("/api/events", {lat: pos.lat, lng: pos.lng, radius: 20});
            }, function() {
              // if geolocation failed
              eventMarkers = api_request_events("/api/events", melb);
              handleLocationError(true);
            });
          } else {
            // Browser doesn't support Geolocation
            handleLocationError(false);
          }
        }

        //Let user drop a "pin"
        function plotMarker(location) {
          clearMarkers(markers);
          closeInfoWindows(infoWindows);
          var marker = dropMarker([location],"user");

          marker.addListener('click', function(event) {
            var infoWindow = new google.maps.InfoWindow({map: map, pixelOffset: new google.maps.Size(0, 10)});
            infoWindow.setContent("<button id='expBtn' class='expl'>Show event around</button><a href='/events/new?lat=" + event.latLng.toJSON().lat +
            "&lng=" + event.latLng.toJSON().lng + "'>Create</a>");
            infoWindow.open(map, marker);
            map.setCenter(event.latLng);
            infoWindows.push(infoWindow);
            console.log($("#expBtn"));
            var stop = false;
            $("#expBtn").on('click', function(){
              if(stop === false){
                api_request_events("/api/events", {lat: getLostTo.lat, lng: getLostTo.lng, radius: 100});
              }
              stop = true;
            });

          });
          markers.shift();
          markers.push(marker);
        }

        //load all event markers
         function loadMarkers(locationArr) {
          locationArr.forEach(function(loc){
            var marker = dropMarker([loc.latLng],"event", loc.icon);
            marker.addListener('click', function(event) {

              var popupContent = "<div class='EventInfoWindow'><div class='e_name'>" + loc.listing +
              "</div><div class='hobby'>" + loc.sport + "</div><div><a href='abc'>Bookmark This Event</a></div></div>";
              var infoWindow = new google.maps.InfoWindow({content: popupContent, pixelOffset: new google.maps.Size(0, 10)});
              infoWindow.open(map, marker);
              infoWindows.push(infoWindow);

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

        function dropMarker(locationArr, markerType, iconUrl) {
           var marker;
           var draggable = false;
           if(markerType==="user"){draggable = true}
           for (var i = 0; i < locationArr.length; i++) {
              marker = addMarkerWithTimeout(locationArr[i], i * 400, draggable, iconUrl);
           }
             return marker;
        }

        function addMarkerWithTimeout(position, timeout, draggable, iconUrl) {
             var marker = new google.maps.Marker({
               position: position,
               //map: map,
               animation: google.maps.Animation.DROP,
               draggable: draggable
             });
             if(iconUrl!=="undefined"||iconUrl!==""){
                marker.setIcon(iconUrl);
             }
             window.setTimeout(function() {
               marker.setMap(map);
             }, timeout);
             console.log(marker);
             return marker;
           }


        function closeInfoWindows(windowArr){
          infoWindows = []
          if(windowArr !== []){
            windowArr.forEach(function(w){
              w.close();
            });
          }
        }

        function addInfoWindow(){

        }


        // Sets the map on all markers in the array.
        function setMapOnAll(map, toClear) {
          for (var i = 0; i < markers.length; i++) {
            toClear[i].setMap(map);
          }
        }

        // Removes the markers from the map, but keeps them in the array.
        function clearMarkers(toClear) {
          setMapOnAll(null, toClear);
        }

        //Pop error message if geolocation not available
        function handleLocationError(browserHasGeolocation) {
        console.log(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        }
