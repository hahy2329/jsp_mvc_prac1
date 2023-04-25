<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분기문</title>
</head>
<body>
	
	
	<h3>if문</h3>
	<c:set var="grade" value="85"/>
	<c:if test="${grade >= 90 }">
		<c:out value="A학점"/>
	</c:if>
	
	<c:if test="${grade >= 80 }">
		<c:out value="B학점"/>
	</c:if>
	
	<c:if test="${grade >= 70 }">
		<c:out value="C학점"/>
	</c:if>
	
	<hr>
	<h3>when ~ otherwise문</h3>
	<!-- if ~ else문을 의미 -->
	<c:choose>
		<c:when test="${grade >=60 }">
			<c:out value="합격"></c:out>
		</c:when>
		
		<c:otherwise>
			<c:out value="불합격"></c:out>
		</c:otherwise>
	
	</c:choose>
	
	
	<hr>
	
	<h3> when ~ when ~ otherwise문</h3>
	
	<c:choose>
		<c:when test="${grade >=90 }">
			<c:out value="A학점"></c:out>
		</c:when>
		
		<c:when test="${grade >=80 }">
			<c:out value="B학점"></c:out>
		</c:when>
		
		<c:when test="${grade >=70 }">
			<c:out value="C학점"></c:out>
		</c:when>
		
		<c:when test="${grade >=60 }">
			<c:out value="D학점"></c:out>
		</c:when>
		<c:otherwise>
			<c:out value="F학점"></c:out>
		</c:otherwise>
		
	
	
	</c:choose>
	
	
	
	
	
	
</body>
</html>