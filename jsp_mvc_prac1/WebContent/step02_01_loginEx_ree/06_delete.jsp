<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<%
		String customerId = (String)session.getAttribute("customerId");
	
	%>
	
	<form action="07_deletePro.jsp" method="post">
		<fieldset>
			<legend>회원삭제 '<%=customerId %>'</legend>
			<p>아이디 : <input type="text" name="customerId" value="<%=customerId %>" readonly="readonly"></p>
			<p>패스워드 : <input type="password" name="passwd"></p>
			<p><input type="submit" value="delete"></p>
		
		</fieldset>
	</form>

</body>
</html>