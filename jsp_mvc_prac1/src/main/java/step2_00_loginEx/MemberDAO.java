package step2_00_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public void getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/USER?serverTimezone=UTC";
			String user = "root";
			String password = "tbtur!!852";
			
			conn = DriverManager.getConnection(url,user,password);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	public void getClose() {
		if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
		if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
		if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
	}
	
	
	public boolean insertMember(MemberDTO memberDTO) {
		
		boolean isJoin = false;
		
		try {
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ?");
			pstmt.setString(1, memberDTO.getMemberId());
			rs = pstmt.executeQuery();
			
			
			if(!rs.next()) {
				
				pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(?,?,?,NOW())");
				pstmt.setString(1, memberDTO.getMemberId());
				pstmt.setString(2, memberDTO.getPasswd());
				pstmt.setString(3, memberDTO.getName());
				pstmt.executeUpdate();
				isJoin = true;
				
				
			}
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				getClose();
			}
		
		return isJoin;
	}
	
	
	public boolean loginMember(String memberId, String passwd) {
		
		boolean isLogin = false;
		
		try {
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID =? AND PASSWORD =?");
			pstmt.setString(1, memberId);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isLogin = true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		return isLogin;
	}
			
		
		
		
		
}
	
	
	
	
	

