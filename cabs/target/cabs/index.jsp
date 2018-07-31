<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Tacsai</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="514917710081-n8ukp1r2fejq1mrm1lns8tndh63g1lho.apps.googleusercontent.com">

    <!-- Custom styles for this template -->
    <link href="css/landing-page.min.css" rel="stylesheet">

  </head>

  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-light bg-light static-top">
    	<div class="container">
	  		<a class="navbar-brand" href="#">Tacsai</a>
	  		<div class="navbar navbar_ clearfix">
				<div class="container" id="bookCab" style="display:none">
			    	<form class="form-inline" action="getFareDetails" method="post">
						<input type="text" name="origin" class="form-control" placeholder="Pickup Location">
						<span style="padding-left: 10px;"></span>
						<input type="text" name="destination" class="form-control" style="padding-left: 10px;" placeholder="Drop Location">
						<span style="padding-left: 10px;"></span>
  						<input type="submit" class="btn btn-primary" style="color:black">
					</form>
				</div>   
 			</div>
	      	<div style="float:right" id="signinDiv">
				<div style="float:right; padding-left:10px;"><div id="signout" onclick="signout()" class="btn btn-primary" style="display:none;">Sign Out</div></div>
				<div id="status" style="float:right; padding-left:10px; display:none;"></div>
				<img id="myImg" style="float:right; display:none;"class="gb_8a">
				<div class="g-signin2" data-onsuccess="onSignIn" id="myP" style="float:right"></div>
	      	</div>
  <script type="text/javascript">
  	function onSignIn(googleUser) {
//		 window.location.href='login_success.jsp';
		var profile = googleUser.getBasicProfile();
		var imagurl=profile.getImageUrl();
		var name=profile.getName();
		var email=profile.getEmail();
		document.getElementById("myImg").src = imagurl;
		document.getElementById("status").innerHTML = 'Welcome '+name+'!</p>'
	  	document.getElementById("myP").style.display = "none";
	  	document.getElementById("signout").style.display = "block";
	  	document.getElementById("myImg").style.display = "block";
	  	document.getElementById("status").style.display = "block";
	  	showDiv();
	}
  	function signout(){
  		var auth2 = gapi.auth2.getAuthInstance();
  	    auth2.signOut().then(function () {
  	  		document.getElementById("myP").style.display = "block";
  	    	document.getElementById("signout").style.display = "none";
	  		document.getElementById("myImg").style.display = "none";
	  		document.getElementById("status").style.display = "none";
 			document.getElementById("bookCab").style.display =  "none";  			 
  	    });
  	}
  	function showDiv(){
  		 var isLoggedIn = gapi.auth2.getAuthInstance().isSignedIn.Ab;
  		 if(isLoggedIn){
  			 document.getElementById("bookCab").style.display =  "block";
  		 }else{
  			 document.getElementById("bookCab").style.display =  "none";  			 
  		 }
  	}
  </script>

  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
      </div>
    </nav>

    <!-- Masthead -->
	<header class="masthead text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h1 class="mb-5">Tacsai - Book a taxi and get 20% off on first ride!</h1>
          </div>
        </div>
      </div>
    </header>
	<div style="width:100%; height:500px;">
		<div id="map-canvas" style="width:100%; height:100%;"></div>
		<script>
			var mapOpt, infoWindow;
			$(function() {
				$(window).load(function(){
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
					initMap();
				});
			});

			function initMap() {
				mapOpt = new google.maps.Map(document.getElementById('map-canvas'), {
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
// 						 var marker = new google.maps.Marker({position: pos, map: mapOpt});
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
		<script type="text/css">
		#map-canvas {
        	margin: 0;
        	padding: 0;
        	height: 100%;
       	 	width: 100%;
		}
		</script>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAZTRIPzIm5FTAUR2MnrtgWqjMXbCgHsg&callback=initMap"></script>
	</div>
    <!-- Icons Grid -->
    <section class="features-icons bg-light text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
             	<img src="img/find_location_small.png" style="margin-left:auto; margin-right:auto;">
<!--                 <i class="icon-screen-desktop m-auto text-primary"></i> -->
              </div>
              <h3>Anywhere, anytime<br>Daily commute.</h3>
              <p class="lead mb-0">Errand across town. Early morning flight. Late night drinks. Wherever you are headed, count on Tacsai for a ride. No reservations required</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
              	<img src="img/fist_bump_small.png" style="margin-left:auto; margin-right:auto;">

<!--                 <i class="icon-layers m-auto text-primary"></i> -->
              </div>
              <h3>Low-cost and comfort</h3>
              <p class="lead mb-0">Economy cars at everyday prices are always available.</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
              	<img src="img/mobile_phone_click_2_small.png" style="margin-left:auto; margin-right:auto;">
              
<!--                 <i class="icon-check m-auto text-primary"></i> -->
              </div>
              <h3>Easiest way around</h3>
              <p class="lead mb-0">One tap and a car comes directly to you. Hop in, your driver knows exactly where to go. And when you get there, just step out. Payment is completely seamless.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Testimonials -->
    <section class="testimonials text-center bg-light">
      <div class="container">
        <h2 class="mb-5">What people are saying...</h2>
        <div class="row">
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="img/testimonials-1.jpg" alt="">
              <h5>Margaret E.</h5>
              <p class="font-weight-light mb-0">"Tacsai provides a very good and safe service!"</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="img/testimonials-2.jpg" alt="">
              <h5>Fred S.</h5>
              <p class="font-weight-light mb-0">"Clean cabs, comfortable rides with competitive pricing."</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="img/testimonials-3.jpg" alt="">
              <h5>Sarah	W.</h5>
              <p class="font-weight-light mb-0">"Thanks so much for the flawless service!"</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Bootstrap core JavaScript -->
<!--     <script src="vendor/jquery/jquery.min.js"></script> -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
