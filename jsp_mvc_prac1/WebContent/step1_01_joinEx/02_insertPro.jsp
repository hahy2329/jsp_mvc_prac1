<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		//mysql연결
		//데이터베이스를 연결하기 위한 객체 
		Connection conn = null;
		
		//쿼리문을 실행하기 위한 객체 
		PreparedStatement pstmt = null;
		//요청한 데이터를 db에 적재하기 위한 쿼리문 작성 용도
		
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/USER?serverTimezone=UTC"; //외우지 말것
			
			String user = "root";
			
			String password = "tbtur!!852";
			
			
			conn = DriverManager.getConnection(url,user,password);
			
			String sql = "INSERT INTO USERINFO VALUES(?,?,?,NOW())";
			
			pstmt = conn.prepareStatement(sql);
			// INSERT INTO MEMBER VALUES(?,?,?,NOW())
			pstmt.setString(1,id);
			pstmt.setString(2,passwd);
			pstmt.setString(3,name);
			
			pstmt.executeUpdate();
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			conn.close();
		}
		
		
		
		
	
	
	%>
	
	<a href="00.main.jsp">메인화면으로 이동</a>

</body>
</html>