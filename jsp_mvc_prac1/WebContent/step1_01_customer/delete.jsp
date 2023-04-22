<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>

	<form action="deletePro.jsp" method="post">
		<fieldset>
			<legend>회원탈퇴</legend>
				<p>
					아이디 : <input type="text" name="customerId">
				</p>
				
				<p>
					패스워드 : <input type="password" name="password">
				</p>
				
				<p>
					<input type="submit" value="전송">
					<input type="button" value="메인이동" onclick="location.href='main.jsp'">
				</p>
		</fieldset>
	
	</form>


</body>
</html>