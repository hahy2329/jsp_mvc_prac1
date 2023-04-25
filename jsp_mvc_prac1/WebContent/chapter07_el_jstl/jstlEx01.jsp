<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 기본 문법</title>
</head>
<body>
	<h3>변수 생성, 출력, 삭제</h3>
	<c:set var="name1" value="팀 버너스 리"/>
	<c:out value="${ name1}"/> / ${name1 }<br>
	
	
	<c:set var="name2" value="Timothy John Berners Lee"/>
	<c:out value="${name2}"/> / ${name2 }<br>
	
	<c:remove var="name1"/>
	
	<c:out value="${name1 }"/> / ${name1 }<br>
	<c:out value="${name2 }"/> / ${name2 }<br>
	
	


</body>
</html>