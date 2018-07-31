<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.api.cabs.model.Cabs" %>	
<%@ page import="org.json.JSONObject" %>	
<!DOCTYPE html>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<%
	JSONObject respJSON = (JSONObject) request.getAttribute("respJSON");
 	Cabs cab =  (Cabs) request.getAttribute("cab");
%>
<body>
<%-- <%@ include file="index.jsp" %> --%>
	<h2>Booking details</h2>
	<table class="table">
		<thead>
			<tr>
		     	<td>From</td>
		      	<td><% out.println(respJSON.get("source")); %></td>
		    </tr>
		</thead>
		<tbody>
		 	<tr>
		     	<td>To</td>
		      	<td><% out.println(respJSON.get("destination")); %></td>
		   	</tr>
		    <tr>
		     	<td>Estimated travel time</td>
		      	<td><% out.println(respJSON.get("travelTime")); %></td>
		    </tr>
		    <tr>
		      	<td>Estimated Cab Fare</td>
		      	<td><% out.println(respJSON.get("estimatedFare")); %></td>
		    </tr>
		</tbody>
	</table>
	<form class="form-inline" action="getCabDetails" method="post">
		<input type="hidden" name="source" id="source" value="<%=respJSON.get("source")%>">
		<input type="hidden" name="destination" id="destination" value="<%=respJSON.get("destination")%>">
		<input type="submit" class="btn btn-primary" style="color:black">
	</form>	
</body>
</html>