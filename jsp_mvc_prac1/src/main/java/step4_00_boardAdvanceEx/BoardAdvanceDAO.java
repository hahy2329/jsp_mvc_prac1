package step4_00_boardAdvanceEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

public class BoardAdvanceDAO {
	
	private BoardAdvanceDAO() {}
	
	//Singleton 패턴 적용
	private static BoardAdvanceDAO instance = new BoardAdvanceDAO();
	public static BoardAdvanceDAO getInstance() {
		return instance;
	}
	
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public void getConnection() {
		
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BOARD_ADVANCE_EX?serverTimezone=UTC&useSSL=false", "root", "tbtur!!852");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void getClose() {
		if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
		if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
	}
	
	public void insertBoard(MainBoardDTO mainBoardDTO) {
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("INSERT INTO MAIN_BOARD(WRITER , SUBJECT , CONTENT, PASSWD) VALUES(?,?,?,?)");
			pstmt.setString(1, mainBoardDTO.getWriter());
			pstmt.setString(2, mainBoardDTO.getSubject());
			pstmt.setString(3, mainBoardDTO.getContent());
			pstmt.setString(4, mainBoardDTO.getPasswd());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		
		
	}
	
	
	public int getAllBoardCnt(String searchKeyword, String searchWord) {
		
		int totalBoardCnt = 0;
		
		try {
			getConnection();
			String sql = "";
			if(searchKeyword.equals("total")) {
				if(searchWord.equals("")) {
				sql = "SELECT COUNT(*) FROM MAIN_BOARD";
				pstmt = conn.prepareStatement(sql);
			}
				else {
					sql ="SELECT COUNT(*) FROM MAIN_BOARD";
					sql += "WHERE SUBJECT LIKE CONCAT('%', ?,'%')";
					sql += "OR WRITER LIKE CONCAT('%', ?, '%')";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, searchWord);
					pstmt.setString(2, searchWord);
				}
			
			
			}
			else {
				sql = "SELECT COUNT(*) FROM MAIN_BOARD WHERE " + searchKeyword + "LIKE CONCAT('%',?,'%')";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalBoardCnt = rs.getInt(1);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		return totalBoardCnt;
	}
	
	
	
	public ArrayList<MainBoardDTO> getBoardList(String searchKeyword, String searchWord,  int startBoardIdx, int searchCnt){
		
		ArrayList<MainBoardDTO> boardList = new ArrayList<MainBoardDTO>();
		
		try {
			
			getConnection();
			
			String sql = "";
			
			if(searchKeyword.equals("total")) {
				
				if(searchWord.equals("")) {
					sql ="SELECT * FROM MAIN_BOARD ORDER BY ENROLL_DT DESC LIMIT ?,? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, startBoardIdx);
					pstmt.setInt(2, searchCnt);
				}
				else {
					sql = "SELECT * FROM MAIN_BOARD";
					sql += "WHERE SUBJECT LIKE CONCAT('%', ?, '%')";
					sql += "OR WRITER LIKE CONCAT('%', ?, '%')";
					sql += "ORDER BY ENROLL_DT DESC";
					sql += "LIMIT ?,?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, searchWord);
					pstmt.setString(2, searchWord);
					pstmt.setInt(3, startBoardIdx);
					pstmt.setInt(4, searchCnt);
				}
				
				
				
			}
			else {
				sql ="SELECT * FROM MAIN_BOARD WHERE" + searchKeyword + " LIKE CONCAT('%', ? ,'%') ORDER BY ENROLL_DT DESC LIMIT ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, startBoardIdx);
				pstmt.setInt(3, searchCnt);
			}
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				MainBoardDTO mainBoardDTO = new MainBoardDTO();
				mainBoardDTO.setBoardId(rs.getInt("BOARD_ID"));
				mainBoardDTO.setWriter(rs.getString("WRITER"));
				mainBoardDTO.setSubject(rs.getString("SUBJECT"));
				mainBoardDTO.setPasswd(rs.getString("PASSWD"));
				mainBoardDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
				mainBoardDTO.setReadCnt(rs.getLong("READ_CNT"));
				mainBoardDTO.setContent(rs.getString("CONTENT"));
				boardList.add(mainBoardDTO);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return boardList;
		
	}
	
	
public void setDummy() {
		
		Random ran = new Random();
		
		try {
			
			String[] word = {"가","나","다","라","마","바","사","아","자","차","카","타","파","하"};
			
			getConnection();
			
			for (int i = 1; i < 201; i++) {
				String writer  = "";
				String passwd  = "1111";
				String subject = "";
				String content = "";
				for (int j = 0; j < 7; j++) {
					writer  += word[ran.nextInt(word.length)];
					subject += word[ran.nextInt(word.length)];
					content += word[ran.nextInt(word.length)];
				}
				
				pstmt = conn.prepareStatement("INSERT INTO MAIN_BOARD(WRITER , SUBJECT , CONTENT, PASSWD) VALUES(?, ?, ?, ?)");
				pstmt.setString(1, writer);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setString(4, passwd);
				pstmt.executeUpdate();
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
	}
	
	
	
}
