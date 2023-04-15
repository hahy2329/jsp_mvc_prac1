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
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//select문의 결과를 저장하기 위한 객체 
		
		
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/USER?serverTimezone=UTC"; 
			
			String user = "root";
			
			String passwd = "tbtur!!852";
			
			conn = DriverManager.getConnection(url, user, passwd);
			
			pstmt = conn.prepareStatement("SELECT * FROM USERINFORMATION");
			rs = pstmt.executeQuery();
		%>	
			
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>메모</th>
					<th>지역</th>
					<th>가입일자</th>
				
				</tr>
			
			
			
			
		<% 
			while(rs.next()){
				String id = rs.getString("ID");
				String password = rs.getString("PASSWORD");
				String name = rs.getString("NAME");
				int age = rs.getInt("AGE");
				String sex = rs.getString("SEX");
				String memo = rs.getString("MEMO");
				String place = rs.getString("PLACE");
				Date now = rs.getDate("NOW");
		
				
		%>	
		
		<tr>
			<td><%=id %></td>
			<td><%=password %></td>
			<td><%=name %></td>
			<td><%=age %></td>
			<td><%=sex %></td>
			<td><%=memo %></td>
			<td><%=place %></td>
			<td><%=now %></td>
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