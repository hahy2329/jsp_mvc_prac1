<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDeletePro</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
	
	%>
	<jsp:useBean id="mainBoardDTO" class="step4_00_boardAdvanceEx.MainBoardDTO">
		<jsp:setProperty property="*" name="mainBoardDTO"/>
	</jsp:useBean>
	
	<%
		boolean isDelete = BoardAdvanceDAO.getInstance().deleteBoard(mainBoardDTO);
		
		if(isDelete){
	
	%>
		<script>
			alert("정상적으로 삭제되었습니다.");
			location.href="boardList.jsp";
		</script>
	
	<% 
		}
		else{
	%>	
		<script>
			alert("패스워드를 다시 확인해주세요.");
			history.go(-1);
		
		</script>
	
	<%
		}
	%>
	
</body>
</html>