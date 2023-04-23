package step2_02_customer;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomerDAO {

	private CustomerDAO() {}
	private static CustomerDAO instance = new CustomerDAO();
	
	public static CustomerDAO getInstance() {
		
		return instance;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 외우지 말 것 
			
			// DB 연결 정보 > "jdbc:mysql://DB서버주소:프로토콜번호/DB명?옵션"
			String url = "jdbc:mysql://localhost:3306/CUSTOMER?serverTimezone=UTC"; //외우지 말것 
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
			
			pstmt = conn.prepareStatement("SELECT * FROM  CUSTOMER_INFO WHERE CUSTOMER_ID = ? AND PASSWORD = ? ");
			pstmt.setString(1, customerDTO.getCustomerId());
			pstmt.setString(2, customerDTO.getPassword());
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				pstmt = conn.prepareStatement("INSERT INTO CUSTOMER_INFO VALUES(?,?,?,?,?,?,?)");
				pstmt.setString(1, customerDTO.getCustomerId());
				pstmt.setString(2, customerDTO.getPassword());
				pstmt.setInt(3, customerDTO.getAge());
				pstmt.setString(4, customerDTO.getName());
				pstmt.setString(5, customerDTO.getSex());
				pstmt.setString(6,customerDTO.getHobby());
				pstmt.setString(7, customerDTO.getAddress());
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
	
	
	public boolean deleteCustomer(CustomerDTO customerDTO) {
		boolean isDelete = false;
		
		try {
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM CUSTOMER_INFO WHERE CUSTOMER_ID = ? AND PASSWORD = ?");
			pstmt.setString(1,customerDTO.getCustomerId());
			pstmt.setString(2, customerDTO.getPassword());
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				pstmt= conn.prepareStatement("DELETE FROM CUSTOMER_INFO WHERE CUSTOMER_ID = ?");
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
	
	public ArrayList<CustomerDTO> listCustomer(){
		
		ArrayList<CustomerDTO> customerDTO = new ArrayList<CustomerDTO>();
		
		try {
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM CUSTOMER_INFO");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CustomerDTO temp = new CustomerDTO();
				temp.setCustomerId(rs.getString("CUSTOMER_ID"));
				temp.setPassword(rs.getString("PASSWORD"));
				temp.setAge(rs.getInt("AGE"));
				temp.setName(rs.getString("NAME"));
				temp.setSex(rs.getString("SEX"));
				temp.setHobby(rs.getString("HOBBY"));
				temp.setAddress(rs.getString("ADDRESS"));;
				customerDTO.add(temp);
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		
		
		
		
		
		return customerDTO; 
		
	}
	
	public boolean updateCustomer(CustomerDTO customerDTO) {
		boolean isUpdate = false;
		
		try {
			getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM CUSTOMER_INFO WHERE CUSTOMER_ID = ? AND PASSWORD = ?");
			pstmt.setString(1, customerDTO.getCustomerId());
			pstmt.setString(2, customerDTO.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				pstmt = conn.prepareStatement("UPDATE CUSTOMER_INFO SET NAME = ? WHERE CUSTOMER_ID = ? AND PASSWORD = ?");
				pstmt.setString(1, customerDTO.getName());
				pstmt.setString(2, customerDTO.getCustomerId());
				pstmt.setString(3, customerDTO.getPassword());
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
	
	
	
	
	

