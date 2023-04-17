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
	<%--
		#데이터베이스 연동 방법
		
		1)mysql-connector-java-x.x.xx.jar파일을 WEB-INF 폴더안의 lib 폴더에 넣는다. 
		2)Class.forName("com.mysql.cj.jdbc.Driver"); 을 작성한다.
		3)DriverManager의 getConnection(db연결정보,연결id,연결password) 메소드를 통하여서 Connection 객체를 생성한다.
		4)쿼리문을 작성하여 선처리문 객체를 생성한다.
		5)선처리문 객체를 사용하여 sql 쿼리문을 jsp에서 실행한다.
	 --%>
	 
	 
	 <%
	 	request.setCharacterEncoding("utf-8");
	 	
	 	String id = request.getParameter("id");
	 	String passwd = request.getParameter("passwd");
	 	String name = request.getParameter("name");
	 	
	 	
	 	//MYSQL 연결
	 	//데이터베이스를 연결하기 위한 객체 
	 	Connection conn = null;
	 	
	 	//쿼리문을 실행하기 위한 객체 
	 	PreparedStatement pstmt = null;//요청한 데이터를 db에 적재하기 위한 쿼리문 작성 용도
	 	
	 	try{
	 		
	 		Class.forName("com.mysql.cj.jdbc.Driver");
	 		
	 		String url = "jdbc:mysql://localhost:3306/USER?serverTimezone=UTC";
	 		
	 		String user = "root";
	 		
	 		String password = "tbtur!!852";
	 		
	 		conn = DriverManager.getConnection(url, user, password);
	 		
	 		String sql = "INSERT INTO USERINFO VALUES(?,?,?,NOW())";
	 		
	 		pstmt = conn.prepareStatement(sql);
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
	 
	 <a href="00_main.jsp">메인화면으로 이동</a>
	

</body>
</html>