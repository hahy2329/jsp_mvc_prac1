<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>

	<form action="insertPro.jsp" method="post">
		<fieldset>
			<legend>회원가입</legend>
			<p>
				아이디 : <input type="text" name="customerId">
			</p>
			
			<p>
				패스워드 : <input type="password" name="password">
			</p>
			<p>
				이름 : <input type="text" name="name">
			</p>
			<p>
				나이 : <input type="text" name="age">
			</p>
			
			<p>
				성별 : 
				<input type="radio" name="sex" value="man">남 &nbsp;
				<input type="radio" name="sex" value="woman">여
				
			</p>
			
			<p>
				취미 :
				<input type="radio" name="hobby" value="운동">운동 &nbsp;
				<input type="radio" name="hobby" value="게임">게임 &nbsp;
				<input type="radio" name="hobby" value="요리">요리 &nbsp;
				<input type="radio" name="hobby" value="독서">독서 &nbsp;
				<input type="radio" name="hobby" value="기타">기타 &nbsp;
						
					
					
			</p>
			
			<p>
			
				거주지:
					<select name="address">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="충청도">충청도</option>
						<option value="전라도">전라도</option>
						<option value="강원도">강원도</option>
						<option value="경상도">경상도</option>
					
					</select>
			</p>
			<p>
				<input type="submit" value="전송">
				<input type="button" value="메인이동" onclick="location.href='main.jsp'">
			
			</p>
		
		
		
		</fieldset>
	
	
	</form>
	
</body>
</html>