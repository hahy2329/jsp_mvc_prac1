<%@page import="java.util.Date"%>
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
<title>list</title>
</head>
<body>
	
<%
	Connection conn = null;
	PreparedStatement pstmt = null; 
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url="jdbc:mysql://localhost:3306/USER?serverTimezone=UTC";
		String user = "root";
		String password = "tbtur!!852";
		
		conn = DriverManager.getConnection(url, user, password);
		
		String sql = "SELECT * FROM MEMBER";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
	%>
	
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>가입날짜</th>
			</tr>
			
			
		<%
			while(rs.next()){
				String id = rs.getString("ID");
				String passwd = rs.getString("PASSWORD");
				String name = rs.getString("NAME");
				Date date = rs.getDate("JOIN_DATE");
				
		%>
		
		<tr>
			<td><%=id %></td>
			<td><%=passwd %></td>
			<td><%=name %></td>
			<td><%=date %></td>
		</tr>
		
		
		
		<% 		
			}
		
		
		%>	
			
			
			
			
				
		
		
		</table>
		<a href="00_main.jsp">메인으로 이동</a>		
		
		
	<% 		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
		}
		
	
	%>


</body>
</html>