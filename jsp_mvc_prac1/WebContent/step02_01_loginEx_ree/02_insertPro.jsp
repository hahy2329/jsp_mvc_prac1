<%@page import="step2_00_loginEx.CustomerDAO"%>
<%@page import="step2_00_loginEx.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertPro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		CustomerDTO customerDTO = new CustomerDTO();
		
		customerDTO.setCustomerId(request.getParameter("customerId"));
		customerDTO.setPasswd(request.getParameter("passwd"));
		customerDTO.setName(request.getParameter("name"));
		customerDTO.setAddress(request.getParameter("location"));
		customerDTO.setSex(request.getParameter("sex"));
	
		boolean isInsert = CustomerDAO.getInstance().insertCustomer(customerDTO);
		
		
		if(isInsert){
	%>
	
		<script>
			alert("You are now a customer.");
			location.href="00_main.jsp";
		</script>	
			
			
			
	<% 		
		}else{
			
	%>		
		<script>
			alert("This is duplicated ID");
			history.go(-1);
		</script>
		
			
	<% 		
		}
	
	
	%>

</body>
</html>