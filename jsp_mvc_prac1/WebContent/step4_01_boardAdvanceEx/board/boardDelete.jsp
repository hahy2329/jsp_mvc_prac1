<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDelete</title>
</head>
<body>
	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));
		MainBoardDTO mainBoardDTO = BoardAdvanceDAO.getInstance().getBoardDetail(boardId, false);
		
	
	%>
	<div align="center" style="padding-top:100px">
		<form action="boardDeletePro.jsp" method="post">		
		
		<h2>게시글 상세</h2>
		<table style="width:700px; text-align:center" border="1">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<td>작성자</td>
				<td><%=mainBoardDTO.getWriter() %></td>
			</tr>
			
			<tr>
				<td>작성일</td>
				<td><%=mainBoardDTO.getEnrollDt() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=mainBoardDTO.getSubject() %></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="passwd" value="<%=mainBoardDTO.getPasswd() %>">
				
			</tr>
			<tr align="right">
				<td colspan="2">
					<input type="hidden" name="boardId" value="<%=mainBoardDTO.getBoardId() %>">
					<input type="submit" value="글삭제">
					<input type="button" onclick="location.href='boardList.jsp'" value="목록보기">
				</td>
			
			</tr>
			
			
			
		
		</table>
	</form>
</div>

</body>
</html>