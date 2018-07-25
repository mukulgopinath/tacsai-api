<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.api.cabs.model.Cabs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
 	Cabs cab =  (Cabs) request.getAttribute("cab");
	out.println(cab.getCab_id());
	out.println(cab.getColor());
	%>
</body>
</html>