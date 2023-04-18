<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		
		session.setAttribute("id", id);
		session.setAttribute("role", "admin");
		
		
		session.setMaxInactiveInterval(60 * 60);
		
		String role="admin";
		
		
		
		
	
	%>
	
	<h3>로그인 되었습니다.</h3>
	<p><%=id %>(<%=role %>)님 로그인중</p>
	
	<hr>
	
	<p><a href="sessionEx02_03.jsp">마이페이지</a></p>
	<p><a href="sessionEx02_04.jsp">카트리스트</a></p>
	<p><a href="sessionEx02_05.jsp">로그아웃</a></p>


</body>
</html>