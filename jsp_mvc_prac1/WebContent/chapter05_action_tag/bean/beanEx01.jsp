<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="beanEx01Pro.jsp" method="post" >
		<fieldset>
			<p>상품코드 :   <input type="text" name="pdCd"></p>
			<p>상품이름 :   <input type="text" name="pdNm"></p>
			<p>부서코드 :   <input type="text" name="deptCd"></p>
			<p>부서이름 :   <input type="text" name="deptNm"></p>
			<p>담당자코드 : <input type="text" name="mgrCd"></p>
			<p>담당자이름 : <input type="text" name="mgrNm"></p>
			<p><input type="submit" value="전송"></p>
		</fieldset>
	</form>
</body>
</html>