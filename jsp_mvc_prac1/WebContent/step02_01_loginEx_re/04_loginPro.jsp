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
	
	
	%>
		<script>
			alert("Logged in");
			location.href="00_main.jsp";
		</script>
		
		
	<%
	
		}else{
	%>
		<script>
			alert("chech your ID or password");
			history.go(-1);
		
		</script>
	
	<%
		}
	%>

</body>
</html>