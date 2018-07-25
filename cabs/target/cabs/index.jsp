<!DOCTYPE html>
<html lang="en">
<head>
<title>Tacsai</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css"	media="screen">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>
<!-- <script type="text/javascript" src="js/jquery.js"></script> -->
<!-- <script type="text/javascript" src="js/superfish.js"></script> -->
<!-- <script type="text/javascript" src="js/jquery.easing.1.3.js"></script> -->
<!-- <script src="js/jquery.ui.totop.js" type="text/javascript"></script> -->
<!-- <script type="text/javascript" src="js/forms.js"></script> -->
<!-- <script type="text/javascript" src="js/jquery.cookie.js"></script> -->
<!--[if lt IE 8]>
  		<div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div>  
 	<![endif]-->
<!--[if lt IE 9]>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:700' rel='stylesheet' type='text/css'>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/docs.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
  <![endif]-->

<script type="text/javascript">
	// $(document).ready(function()
	// { $("#ajax-contact-form").submit(function() { var str = $(this).serialize(); $.ajax( { type: "POST", url: "contact.php", data: str, success: function(msg)
	// 						{ if(msg == 'OK') // Message Sent? Show the 'Thank You' message and hide the form
	// 							{ result = '<div class="notification_ok">Your message has been sent. Thank you!<br> <a href="#" onclick="freset();return false;">send another mail</a></div>'; $("#fields").hide(); } 							else
	// 							{ result = msg; } $("#note").html(result); } 
	// 				}); return false; }); });
	// function freset()
	// { 	$("#note").html(''); 	document.getElementById('ajax-contact-form').reset(); 	$("#fields").show();}
</script>


</head>

<body>
	<!--==============================Header=================================-->
	<header>
		<div class="container">
			<div class="row">
				<div class="span12">
					<div class="clearfix">
						<div class="clearfix header-block-pad">
							<h1 style="color: white">TACSAI</h1>
						</div>
					</div>
					<div class="navbar navbar_ clearfix">
			        	<div class="container">
			        		<form class="form-inline" action="getFareDetails" method="post">
								<input type="text" name="origin" class="form-control" placeholder="Pickup Location">
								<span class="form-control mb-2 mr-sm-2">.</span>
								<input type="text" name="destination" class="form-control mb-2 mr-sm-2"placeholder="Drop Location">
  								<span class="form-control mb-2 mr-sm-2">.</span>
  								<input type="submit" class="mb-2 mr-sm-2 btn btn-primary " style="color:black">
							</form>
						</div>   
 					</div>
				</div>
			</div>
		</div>

		<!--==============================top area=================================-->
		<div id="top-area-contact">
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<div id="map-canvas"></div>
			<script>
				// Note: This example requires that you consent to location sharing when
				// prompted by your browser. If you see the error "The Geolocation service
				// failed.", it means you probably did not give permission for the browser to
				// locate you.
				var mapOpt, infoWindow;
				$(function() {
					var mapOptions = {
						zoom : 12,
						center : new google.maps.LatLng(-34.397, 150.644)
					};
					var map = new google.maps.Map($("#map-canvas")[0], mapOpt);

					// listen for the window resize event & trigger Google Maps to update too
					$(window).resize(function() {
						// (the 'map' here is the result of the created 'var map = ...' above)
						google.maps.event.trigger(mapOpt, "resize");
					});
				});

				function initMap() {
					mapOpt = new google.maps.Map(document
							.getElementById('map-canvas'), {
						center : {
							lat : -34.397,
							lng : 150.644
						},
						zoom : 12
					});
					infoWindow = new google.maps.InfoWindow;

					if (navigator.geolocation) {
						navigator.geolocation.getCurrentPosition(function(
								position) {
							var pos = {
								lat : position.coords.latitude,
								lng : position.coords.longitude
							};
							infoWindow.setPosition(pos);
							infoWindow.setContent('Your are here');
							infoWindow.open(mapOpt);
							mapOpt.setCenter(pos);
						}, function() {
							handleLocationError(true, infoWindow, mapOpt
									.getCenter());
						});
					} else {
						// Browser doesn't support Geolocation
						handleLocationError(false, infoWindow, mapOpt
								.getCenter());
					}
				}

				function handleLocationError(browserHasGeolocation, infoWindow,
						pos) {
					infoWindow.setPosition(pos);
					infoWindow
							.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
									: 'Error: Your browser doesn\'t support geolocation.');
					infoWindow.open(mapOpt);
				}
			</script>
			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAZTRIPzIm5FTAUR2MnrtgWqjMXbCgHsg&callback=initMap">
				
			</script>
		</div>
	</header>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>