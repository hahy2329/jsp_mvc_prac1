<%@page import="step2_00_loginEx.CustomerDAO"%>
<%@page import="step2_00_loginEx.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro</title>
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
		
		boolean isUpdate = CustomerDAO.getInstance().updateCustomer(customerDTO);
		
		if(isUpdate){
	
	%>
		<script>
			alert("업데이트 완료");
			location.href="00_main.jsp";
		</script>
	<%
		}else{
	
	%>
		<script>
			alert("아이디 혹은 비밀번호를 다시 확인하여 주십시오.");
			history.go(-1);
		
		</script>
	
	
	<%
		}
	
	%>
</body>
</html>