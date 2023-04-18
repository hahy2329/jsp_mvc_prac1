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
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		
		String role = "admin";
		
	
	%>
	
	<h3>로그인 되었습니다.</h3>
	<p><%=id %>(<%=role %>)님 로그인중</p>
	
	
	<p><a href="sessionEx01_03.jsp">마이페이지</a></p>
	<p><a href="sessionEx01_04.jsp">카트리스트</a></p>


</body>
</html>