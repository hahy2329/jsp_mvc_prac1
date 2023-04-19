<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<form action="02_insertPro.jsp" method="post">
		<fieldset>
			<legend>join</legend>
			<p>Id : <input type="text" name="customerId"></p>
			<p>Password : <input type="password" name="passwd"></p>
			<p>Name : <input type="text" name="name"></p>
			<p>Address : 
				<select name="location">
					<option>서울</option>
					<option>경기도</option>
					<option>강원도</option>
					<option>충청도</option>
					<option>전라도</option>
					<option>경상도</option>
				</select>
			</p>
			<p>Sex : 
				<input type="radio" name="sex">남
				<input type="radio" name="sex">여
			</p>
			<p><input type="submit" value="join"></p>	
				
		</fieldset>
	
	</form>


</body>
</html>