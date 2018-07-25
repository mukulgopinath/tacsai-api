<!-- <html>
<body>
	<form action="getCab">
		<input type="text" name="cab_id">
		<input type="submit">
	</form>
<!--     <h2>Jersey RESTful Web Application!</h2> -->
<!--     <p><a href="webapi/myresource">Jersey resource</a> -->
<!--     <p>Visit <a href="http://jersey.java.net">Project Jersey website</a> -->
<!--     for more information on Jersey! -->
<!--/body>
</html>-->

<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 50%;
        width: 60%;
      }
      /* Optional: Makes the sample page fill the window. */
      
    </style>
  </head>
  <body>
  	<form action="getFare">
		<input type="text" name="origin">
		<input type="text" name="destination">
		<input type="submit">
	</form>
 <!--   <div id="map"></div>
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 12
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
			console.log(pos)
            infoWindow.setPosition(pos);
            infoWindow.setContent('Your are here');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAZTRIPzIm5FTAUR2MnrtgWqjMXbCgHsg&callback=initMap">
    </script>-->
  </body>
</html>