<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/USER?serverTimezone=UTC";
			String user = "root";
			String password = "tbtur!!852";
			
			conn = DriverManager.getConnection(url,user,password);
			
			String sql = "SELECT * FROM MEMBER WHERE ID = ? AND PASSWORD =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pstmt = conn.prepareStatement("UPDATE MEMBER SET NAME=? WHERE ID = ?");		
				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
	%>
			<script>
				alert("수정되었습니다.");
				location.herf="00_main.jsp";
			</script>
	<% 			
			}
			else{
				
	%>
			<script>
				alert("아이디 혹은 비밀번호를 확인해주세요.");
				history.go(-1);
			</script>
	<% 			
			}
	%>	
	
	
			
			
	<% 		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(Exception e){e.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(Exception e){e.printStackTrace();}
			if(conn != null)try{conn.close();}catch(Exception e){e.printStackTrace();}	
		}
		
	
	
	%>
	
</body>
</html>