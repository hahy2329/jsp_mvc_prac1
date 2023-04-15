<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<form action="02_insertPro.jsp" method="post">
		<fieldset>
			<legend>용기네 농장</legend>
				<p>아이디 :<input type="text" name="id"></p>
				<p>비밀번호 : <input type="password" name="password"></p>
				<p>이름 : <input type="text" name="name"></p>
				<p>나이 :<input type="text" name = "age"></p>
				<p>성별 : 
					<input type ="radio" name="sex"> 남 &nbsp;
					<input type="radio" name="sex"> 여 
				
				</p>
				용기 대표님께 바라는 점 :
				<p><textarea rows="10" cols="30" name="memo"></textarea>
			
				<p>거주지역 :
					<select name="place">
						<option>서울</option>
						<option>경기</option>
						<option>충청도</option>
						<option>강원도</option>
						<option>전라도</option>
						<option>경상도</option>
						<option>서울</option>
					</select> 
				</p>
				<p><input type="submit" value="가입"></p>	
			
			
		</fieldset>	
	
	</form>

</body>
</html>