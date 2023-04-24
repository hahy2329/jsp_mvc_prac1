<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	#EL (Expression Language)
	
		- 자바코드를 사용하지 않고 간편하게 출력을 지원하기 위한 방법이다.
		- 자바의 문법과 html의 태그요소들이 섞여있기에 프론트와 백앤드의 효율적인 업무 분리 작업을 위하여
			나온 표현방법이 EL이다.
		-$와 {}를 사용하여 표현한다.



 --%>
 
 	<h3>자바의 변수 표기</h3>
 	
 		<p>${name }</p>
 		<p>${num1 }</p>
 		<p>${num2 }</p>
 		
 		<hr>
 		
 		<h3>산술연산자</h3>
 		<p>${num1 + num2 }</p>
 		<p>${num1 - num2 }</p>
 		<p>${num1 * num2 }</p>
 		<p>${num1 / num2 }, ${num1 div num2 }</p>
 		<p>${num1 % num2 }, ${num1 mod num2 }</p>
 		<hr>
 		
 		<h3>관계 연산자</h3>
 		<p>${num1 > num2 }, ${num1 gt num2 }</p>
 		<p>${num1 >= num2 }, ${num1 ge num2 }</p>
 		<p>${num1 < num2 }, ${num1 lt num2 }</p>
 		<p>${num1 <= num2 }, ${num1 le num2 }</p>
 		<p>${num1 == num2 }, ${num1 eq num2 }</p>
 		<p>${num1 != num2 }, ${num1 eq num2 }</p>
 		
 			<h3>논리 연산자</h3>
		<p>${1 == 1 && 1 == 1 }, ${1 == 1 and 1 == 1 }</p>
		<p>${1 == 1 || 1 == 1 }, ${1 == 1 or 1 == 1 }</p>
		<p>${!(1 == 1) }, ${not(1 == 1) }</p>
 		
 
</body>
</html>