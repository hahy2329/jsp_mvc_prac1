<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
		border: 0;
		float: left;
	
	}
</style>
<script>
	function getBoardList(){
		
		var onePageViewCnt = document.getElementById("onePageViewCnt").value;
		var searchKeyword    = document.getElementById("searchKeyword").value;
		var searchWord       = document.getElementById("searchWord").value;
		
		var url = "boardList.jsp?searchKeyword=" + searchKeyword;
		   url += "&searchWord=" + searchWord 
		   url += "&onePageViewCnt=" + onePageViewCnt;
		
		   location.href = url;
	}
</script>
</head>
<body>
	
	<p align="right">
		<input type="button" value="테스트 데이터 생성" onclick="location.href='setDummy.jsp'">
	</p>
	
	<%
	
		request.setCharacterEncoding("utf-8");
	
		String searchKeyword = request.getParameter("searchKeyword");
		if(searchKeyword==null){
			searchKeyword="total";
		}
		
		String searchWord = request.getParameter("searchWord");
		if(searchWord == null){
			searchWord = "";
		}
		
		String tempCnt = request.getParameter("onePageViewCnt");
		if(tempCnt==null){
			tempCnt="10";
		}
		int onePageViewCnt = Integer.parseInt(tempCnt);
		
		String tempPageNum = request.getParameter("currentPageNumber");
		if(tempPageNum == null){
			tempPageNum = "1";
		}
		
		int currentPageNumber = Integer.parseInt(tempPageNum);
		int totalBoardCnt = BoardAdvanceDAO.getInstance().getAllBoardCnt(searchKeyword,searchWord);
		int startBoardIdx = (currentPageNumber -1) * onePageViewCnt;
		ArrayList<MainBoardDTO> boardAdvanceList = BoardAdvanceDAO.getInstance().getBoardList(searchKeyword, searchWord,startBoardIdx, onePageViewCnt);
		
		
		
	
	%>
	<div align="center" style="padding-top:100px">
		<h2>게시글 리스트</h2>
		<table border="1">
			<colgroup>
				<col width = "10%">
				<col width = "40%">
				<col width = "20%">
				<col width = "20%">
				<col width = "10%">
			</colgroup>
			<tr>
				<td>
					조회 : <span style="color:red"><%=totalBoardCnt%></span>개
				</td>
				<td colspan="4" align="right">
					<select id="onePageViewCnt" onchange="getBoardList()">
						<option <%if (onePageViewCnt == 5) {%> selected <%}%>>5</option>
						<option <%if (onePageViewCnt == 7) {%> selected <%}%>>7</option>
						<option <%if (onePageViewCnt == 10) {%> selected <%}%>>10</option>
					
					</select>
				</td>
			</tr>
			<tr align="center">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				
			</tr>
			
		<%
			for(MainBoardDTO mainBoardDTO : boardAdvanceList){
		
		%>
			<tr align="center">
				<td><%=++startBoardIdx %></td>
				<td align="left">
					<a href="boardDetail.jsp?boardId=<%=mainBoardDTO.getBoardId() %>"><%= mainBoardDTO.getSubject() %></a>
				</td>
				<td><%= mainBoardDTO.getWriter() %></td>
				<td><%= mainBoardDTO.getEnrollDt() %></td>
				<td><%= mainBoardDTO.getReadCnt() %></td>
			</tr>
			
		<% 
			}
		%>	
			<tr align="right">
				<td colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='boardWrite.jsp'">
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<select id="searchKeyword">
						<option <%if (searchKeyword.equals("total")) {%>selected<% }%> value="total">전체검색</option>
						<option <%if (searchKeyword.equals("writer")) {%> selected <% }%> value="writer">작성자</option>
						<option <%if (searchKeyword.equals("subject")) {%> selected <% }%> value="subject">제목</option>
					</select>
					<input type="text" id="searchWord" name="searchWord" value="<%=searchWord %>"> 
					<input type="button" value="검색" onclick="getBoardList()">
				</td>
			</tr>
		</table>
		<div style="display: table; margin-left: auto; margin-right: auto">
		<%
		
		
		
		
		%>
		
	</div>
	
	
	



</body>
</html>