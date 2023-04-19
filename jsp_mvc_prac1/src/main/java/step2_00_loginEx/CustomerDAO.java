package step2_00_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO {
	
	private CustomerDAO() {}
	
	private static CustomerDAO instance = new CustomerDAO();
	
	public static CustomerDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	

		
	public void getConnection() {

	
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 외우지 말 것 
			
			// DB 연결 정보 > "jdbc:mysql://DB서버주소:프로토콜번호/DB명?옵션"
			String url = "jdbc:mysql://localhost:3306/LOGIN_EX?serverTimezone=UTC"; //외우지 말것 
			// DB 연결 계정
			String user    = "root";
			// DB 연결 비밀번호
			String password  = "tbtur!!852";
			
			//데이터베이스 연동 
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
		}	
		

	
	}
	
	
	public void getClose() {
		if(rs != null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if(pstmt != null)try{pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if(conn != null)try{conn.close();} catch (SQLException e) {e.printStackTrace();}
	}
	
	
	public boolean insertCustomer(CustomerDTO customerDTO) {
		
		boolean isInsert = false;
		try {
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE CUSTOMER_ID = ?");
			pstmt.setString(1, customerDTO.getCustomerId());
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				pstmt = conn.prepareStatement("INSERT INTO CUSTOMER VALUES(?,?,?,?,?,NOW())");
				pstmt.setString(1, customerDTO.getCustomerId());
				pstmt.setString(2, customerDTO.getPasswd());
				pstmt.setString(3, customerDTO.getName());
				pstmt.setString(4, customerDTO.getAddress());
				pstmt.setString(5, customerDTO.getSex());
				pstmt.executeUpdate();
				isInsert = true;
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		
		
		
		
		return isInsert;
	}
	
	public boolean loginCustomer(String customerId, String passwd) {
		boolean isLogin = false;
		
		
		try {
			
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE CUSTOMER_ID = ? AND PASSWD = ?");
			pstmt.setString(1, customerId);
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
	
	
	public boolean deleteCustomer(CustomerDTO customerDTO) {
		
		boolean isDelete = false;
		
		try {
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE CUSTOMER_ID =? AND PASSWD = ? ");
			pstmt.setString(1, customerDTO.getCustomerId());
			pstmt.setString(2, customerDTO.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pstmt = conn.prepareStatement("DELETE FROM CUSTOMER WHERE CUSTOMER_ID = ?");
				pstmt.setString(1, customerDTO.getCustomerId());
				pstmt.executeUpdate();
				isDelete = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		return isDelete;
	}
	
	public boolean updateCustomer(CustomerDTO customerDTO) {
		boolean isUpdate = false;
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE CUSTOMER_ID = ? AND PASSWD =?");
			pstmt.setString(1, customerDTO.getCustomerId());
			pstmt.setString(2, customerDTO.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt = conn.prepareStatement("UPDATE CUSTOMER SET NAME = ?, ADDRESS = ?, SEX = ?  WHERE CUSTOMER_ID = ?");
				pstmt.setString(1, customerDTO.getName());		
				pstmt.setString(2, customerDTO.getAddress());		
				pstmt.setString(3, customerDTO.getSex());		
				pstmt.setString(4, customerDTO.getCustomerId());		
				pstmt.executeUpdate();
				isUpdate = true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		return isUpdate;
		
		
		
	}
	
	
	
	
}