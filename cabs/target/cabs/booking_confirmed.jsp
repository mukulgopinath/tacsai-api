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
 	Cabs cab =  (Cabs) request.getAttribute("cabDetail");
%>
<body>
<%-- <%@ include file="index.jsp" %> --%>
	<h2>Booking details</h2>
	<table class="table">
		<thead>
			<tr>
		     	<td>Taxi Reg Number</td>
		      	<td><% out.println(cab.getRegno()); %></td>
		    </tr>
		</thead>
		<tbody>
		 	<tr>
		     	<td>To</td>
		      	<td><% out.println(cab.getRegno()); %></td>
		   	</tr>
		    <tr>
		     	<td>Taxi Model & Color</td>
		      	<td><% out.println(cab.getModel()); %>&nbsp;<% out.println(cab.getColor()); %></td>
		    </tr>
		    <tr>
		      	<td>Taxi Driver Name</td>
		      	<td><% out.println(cab.getName()); %></td>
		    </tr>
		    <tr>
		      	<td>Taxi Driver Phone</td>
		      	<td><% out.println(cab.getPhone()); %></td>
		    </tr>
		</tbody>
	</table>
</body>
</html>