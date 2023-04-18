<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertPro</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		Connection conn = null; //db연결 객체 
		
		PreparedStatement pstmt= null; //쿼리문 작성 
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/USER?serverTimezone=UTC";
			
			String user = "root";
			
			String password = "tbtur!!852";
			
			conn = DriverManager.getConnection(url, user, password);
			
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,NOW())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,passwd);
			pstmt.setString(3,name);
			pstmt.executeUpdate();//수정한 걸 저장!
			
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			pstmt.close();
			conn.close();
			
		}
		
		
		
	
	%>
	<a href="00_main.jsp">메인화면으로 이동</a>



</body>
</html>