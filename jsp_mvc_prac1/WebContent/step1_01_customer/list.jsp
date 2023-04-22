<%@page import="step1_01_customer.CustomerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="step1_01_customer.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>취미</th>
			<th>주소</th>
			
		
		</tr>
	
	
	
	
	
	
	<%
	
		ArrayList<CustomerDTO> customerDTO = CustomerDAO.getInstance().listCustomer();
		
		for(CustomerDTO customerList : customerDTO){
	%>
		
		<tr>
			<td><%=customerList.getCustomerId() %></td>
			<td><%=customerList.getPassword() %></td>
			<td><%=customerList.getName() %></td>
			<td><%=customerList.getAge() %></td>
			<td><%=customerList.getSex() %></td>
			<td><%=customerList.getHobby() %></td>
			<td><%=customerList.getAddress() %></td>
		
		</tr>
	
	
	<%
	
		}
	%>
	
	
	</table>
	<p>
		<input type="button" value="메인이동" onclick="location.href='main.jsp'">
	</p>
	
	
	


</body>
</html>