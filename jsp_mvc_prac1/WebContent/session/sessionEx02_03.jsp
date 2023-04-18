<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	String role = (String)session.getAttribute("role");

%>
<p><%=id %>(<%=role %>)님 로그인중</p>

</body>
</html>