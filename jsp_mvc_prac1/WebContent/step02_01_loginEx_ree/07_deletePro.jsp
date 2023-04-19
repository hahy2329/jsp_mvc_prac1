
<%@page import="step2_00_loginEx.CustomerDAO"%>
<%@page import="step2_00_loginEx.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		CustomerDTO customerDTO = new CustomerDTO();
		customerDTO.setCustomerId(request.getParameter("customerId"));
		customerDTO.setPasswd(request.getParameter("passwd"));
		
		
		boolean isDelete = CustomerDAO.getInstance().deleteCustomer(customerDTO);
		
		
		if(isDelete){
			session.invalidate();
	%>		
		<script>
			alert("정상적으로 삭제가 완료되었습니다.");
			location.href="00_main.jsp";
		</script>
		
		
		
	<% 		
		}else{
	%>		
		<script>
			alert("아이디 혹은 비밀번호를 다시 확인해주세요.");
			history.go(-1);
		</script>
		
	<% 		
		}
	
	%>


</body>
</html>