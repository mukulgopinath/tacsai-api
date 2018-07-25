


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.api.cabs.controller.GetFareController" %>
    <%@ page import="org.json.JSONObject" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
 	JSONObject responseJSON = (JSONObject) request.getAttribute("respJSON");
	String travelTime = responseJSON.getString("travelTime");
 	Double estimatedFare = responseJSON.getDouble("estimatedFare");
 	String source = responseJSON.getString("source");
 	String destination = responseJSON.getString("destination");
 	int responseCode = responseJSON.getInt("responseCode");
 	if(responseCode == 200){
 		out.println(estimatedFare);
 %>
 
 <% } %>
</body>
</html>

