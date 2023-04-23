<%@page import="step1_01_customer.CustomerDAO"%>
<%@page import="step1_01_customer.CustomerDTO"%>
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
		customerDTO.setPassword(request.getParameter("password"));
		customerDTO.setName(request.getParameter("name"));
		customerDTO.setAge(Integer.parseInt(request.getParameter("age")));
		customerDTO.setSex(request.getParameter("sex"));
		customerDTO.setHobby(request.getParameter("hobby"));
		customerDTO.setAddress(request.getParameter("address"));
		
		boolean isInsert = CustomerDAO.getInstance().insertCustomer(customerDTO);
		
		
		
		
		if(isInsert){
	
	%>
		<script>
			alert("가입 완료되었습니다.");
			location.href="main.jsp";
		</script>
	
	<% 
		}
		else{
	%>
		<script>
			alert("이미 가입되어있습니다.");
			history.go(-1);
		</script>
		
	<% 
		}
	%>	
</body>
</html>