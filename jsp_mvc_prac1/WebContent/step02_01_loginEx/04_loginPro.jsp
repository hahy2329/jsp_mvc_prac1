<%@page import="step2_00_loginEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		String memberId = request.getParameter("memberId");
		String passwd = request.getParameter("passwd");
		
		
		boolean isLogin = MemberDAO.getInstance().loginMember(memberId, passwd);
		
		if(isLogin){
			
			session.setAttribute("memberId", memberId);
			session.setMaxInactiveInterval(60 * 10);
	%>	
		<script>
			alert("Logged in");
			location.herf="00_main.jsp";
		</script>
		
		
	<%	
		}
		else{
	%>		
			<script>
			alert("check your ID or password");
			history.go(-1);
		
		</script>
			
	<% 		
		}
		
		
		
	
	%>

</body>
</html>