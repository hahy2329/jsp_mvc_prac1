<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWrite</title>
<script src="../../ckeditor/ckeditor.js"></script>
</head>
<body>
	<div align="center" style="padding-top:100px ">
		<form action="boardWritePro.jsp" method="post">
			<h2>게시글 쓰기</h2>
			<br>
			<table style="width: 80%;" border="1">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" size="100"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" size="100"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd" size="100"/></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td><textarea rows="10" cols="50" name="content"></textarea>
					<script>CKEDITOR.replace("content");</script>
					</td>
				</tr>
				
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="글쓰기">
						<input type="reset" value="다시작성">
						<input type="button" value="전체게시글보기" onclick="location.href='boardList.jsp'">
					</td>
				</tr>
				
				
			</table>
		
		</form>
	</div>
	

</body>
</html>