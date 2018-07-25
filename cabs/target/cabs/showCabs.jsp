<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.api.cabs.model.Cabs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<!-- 
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head> -->
<body>

<h1>My First Google Map</h1>

<div id="googleMap" style="width:100%;height:400px;"></div>

<script>
function myMap() {
var mapProp= {
    center:new google.maps.LatLng(51.508742,-0.120850),
    zoom:5,
};
var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
</script>
 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAZTRIPzIm5FTAUR2MnrtgWqjMXbCgHsg&callback=myMap"
  type="text/javascript"></script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAZTRIPzIm5FTAUR2MnrtgWqjMXbCgHsg&callback=myMap"></script> -->
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

</body>
</html>

   <%
		Cabs cab = (Cabs) request.getAttribute("cab");
		//out.println(cab);
	%>
</body>
</html>