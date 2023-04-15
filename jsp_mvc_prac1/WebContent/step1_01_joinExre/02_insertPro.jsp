<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		String memo = request.getParameter("memo");
		String place = request.getParameter("place");
		
		Connection conn =null;
		
		PreparedStatement pstmt = null;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/USER?serverTimezone=UTC";
			
			String user = "root";
			
			String passwd = "tbtur!!852";
			
			conn = DriverManager.getConnection(url,user,passwd);
			
			String sql = "INSERT INTO USERINFORMATION VALUES(?,?,?,?,?,?,?,NOW())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setInt(4, age);
			pstmt.setString(5, sex);
			pstmt.setString(6, memo);
			pstmt.setString(7, place);
			
			pstmt.executeUpdate();
			
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