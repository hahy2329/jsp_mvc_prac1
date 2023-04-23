<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<style>
	ul{
		list-style:none;
		margin:0;
		padding:0;
	
	
	}
	
	li{
		margin: 0 0 0 0;
		padding: 0 0 0 0;
		border : 0;
		float: left;
	
	
	}
	
</style>

</head>
<body>


	<p align="right">
		<input type="button" value="테스트 데이터 생성" onclick="location.href='setDummy.jsp'">
	</p>
	
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String searchKeyword = request.getParameter("searchKeyword");
		if(searchKeyword == null){
			searchKeyword = "total";
		}
		String searchWord = request.getParameter("searchWord");
		if(searchWord==null){
			searchWord = "";
		}
		
		String tempCnt = request.getParameter("onePageViewCnt");
		if(tempCnt == null){
			tempCnt = "10";
		}
		
		int onePageViewCnt = Integer.parseInt(tempCnt);
		
		String tempPageNum = request.getParameter("currentPageNumber");
		if(tempPageNum == null){
			tempPageNum = "1";
		}
		
		int currentPageNumber = Integer.parseInt(tempPageNum);
		int totalBoardCnt = BoardAdvanceDAO.getInstance().getAllBoardCnt(searchKeyword,searchWord);
		
		
	
	
	
	
	%>
	
	

	<div align="center" style="padding-top: 100px">
		<h2>게시글 리스트</h2>
		<table border="1">
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<tr>
				<td>
					조회 : <span style="color:red"><%=totalBoardCnt %></span>개
				</td>
				<td colspan="4" align="right">
					<select id="onePageViewCnt" onchange="getBoardList()">
						<option></option>
						<option></option>
						<option></option>
					
					</select>
		</table>
	</div>
	
	
	




</body>
</html>