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
			
			String url = "jdbc:mysql://localhost:3306/USER?serverTimezone=UTC";
			String user = "root";
			String passwd = "tbtur!!852";
			
			conn = DriverManager.getConnection(url, user, passwd);
			
			pstmt = conn.prepareStatement("SELECT * FROM INFORMATION");
			rs = pstmt.executeQuery();
		%>	
		
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>장소</th>
				<th>나이</th>
				<th>가입날짜</th>
			
			</tr>

		
		<%
		
			while(rs.next()){
				
				String id = rs.getString("ID");
				String password = rs.getString("PASSWORD");
				String name = rs.getString("NAME");
				String sex = rs.getString("SEX");
				String place = rs.getString("PLACE");
				int age = rs.getInt("AGE");
				Date date = rs.getDate("REGISTRATION_DATE");
			
		
		
		%>
			<tr>
				<td><%=id %></td>
				<td><%=password %></td>
				<td><%=name %></td>
				<td><%=sex %></td>
				<td><%=place %></td>
				<td><%=age %></td>
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
			conn.close();
		}
	
	
	
	%>



</body>
</html>