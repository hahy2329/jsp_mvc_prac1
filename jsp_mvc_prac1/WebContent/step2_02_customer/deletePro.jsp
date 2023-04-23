<%@page import="step1_01_customer.CustomerDAO"%>
<%@page import="step1_01_customer.CustomerDTO"%>
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
		customerDTO.setPassword(request.getParameter("password"));
		
		
		
		boolean isDelete = CustomerDAO.getInstance().deleteCustomer(customerDTO);
		
		if(isDelete){
	%>	
		<script>
			alert("정상적으로 삭제되었습니다.");
			location.href="main.jsp";
		</script>	
			
	<% 		
		}
		else{
			
	%>
		<script>
			alert("아이디 혹은 패스워드를 다시 확인해주세요.");
			history.go(-1);
		
		</script>
		
			
	<% 		
		}
	
			
	
	%>


</body>
</html>