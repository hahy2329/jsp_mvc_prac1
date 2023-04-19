<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>

	<%
		String customerId =(String)session.getAttribute("customerId");
		if(customerId == null){
	%>		
		<h3>JUST DO IT!</h3>
		<p><a href="01_insert.jsp">join!</a></p>
		<p>login!</p>
		
	<%	
		}
		else{
	
	%>
		<h3>Welcome!<%=customerId %></h3>
		<p>logout!</p>
		<p>delete!</p>
		<p>update!</p>
		
	<%
		}
	%>


</body>
</html>