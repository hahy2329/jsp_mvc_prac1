<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>

	<%
		session.invalidate();//유효하지 않은
		// or session.removeAttribute("memberId");통해서 세션에 있는 정보를 지워줘도 된다.
	
	%>
	<script>
		alert("로그아웃 완료");
		location.href="00_main.jsp";
	</script>
	
</body>
</html>