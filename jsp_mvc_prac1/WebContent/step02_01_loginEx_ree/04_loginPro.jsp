<%@page import="step2_00_loginEx.CustomerDAO"%>
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
		
		String customerId = request.getParameter("customerId");
		String passwd = request.getParameter("passwd");
		
		boolean isLogin = CustomerDAO.getInstance().loginCustomer(customerId, passwd);
		
		
		if(isLogin){
			
			session.setAttribute("customerId", customerId);
			session.setMaxInactiveInterval(60*10);
	%>		
		<script>
			alert("로그인 완료")
			location.href="00_main.jsp";
		</script>
	<%		
		}else{
			
	%>		
		<script>
			alert("아이디 혹은 비밀번호를 확인해주세요.");
			history.go(-1);
		</script>
		
		
			
	<%		
		}
	
	
	%>


</body>
</html>