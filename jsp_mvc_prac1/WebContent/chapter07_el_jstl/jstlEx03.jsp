<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>for each문</h3>
	
	<c:forEach var="i" begin="1" end="10">
		${i } &nbsp;
	
	</c:forEach>
	
	<hr>
	
	<h3>for each문</h3>
	<c:forEach var="i" begin="1" end="10" step="${i = i+2 }">
		${i } &nbsp;
	</c:forEach>
	<hr>
	
	<h3>for each문</h3>
	<c:forEach var="data" items="${datas }">
		${data } &nbsp;
	</c:forEach>
	
	
	<hr>
	
	<table border="1">
		<tr>	
			<th>상품코드</th>
			<th>상품이름</th>
			<th>부서코드</th>
			<th>부서이름</th>
			<th>담당자코드</th>
			<th>담당자이름</th>
		</tr>
		
		<c:choose>
			<c:when test="${not empty productList }">
				<c:forEach var="productBean" items="${productList }">
					<tr>
						<td>${productBean.pdCd }</td>
						<td>${productBean.pdNm }</td>
						<td>${productBean.deptCd }</td>
						<td>${productBean.deptNm }</td>
						<td>${productBean.mgrCd }</td>
						<td>${productBean.mgrNm }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">데이터가 없습니다.</td>
				</tr>
				
			
			</c:otherwise>
		
		
		</c:choose>
	
	</table>
	
	
	
</body>
</html>