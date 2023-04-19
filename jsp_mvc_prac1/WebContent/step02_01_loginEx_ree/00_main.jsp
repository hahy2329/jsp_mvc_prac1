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
		<p><a href="03_login.jsp">login!</a></p>
		
	<%	
		}
		else{
	
	%>
		<h3>Welcome!<%=customerId %></h3>
		<p><a href="05_logout.jsp">logout!</a></p>
		<p><a href="06_delete.jsp">delete!</a></p>
		<p><a href="08_update.jsp">update!</a></p>
		
	<%
		}
	%>


</body>
</html>