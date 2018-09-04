package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//데이터접근객체
public class BbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	// 데이터 접극객체
	public BbsDAO() {
	 	try {
	 		String dbURL = "jdbc:mysql://localhost:3306/mysql";
	 		String dbID = "root";
	 		String dbPassword = "12345";
	 		Class.forName("com.mysql.jdbc.Driver");
	 		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	 	} catch (Exception e) {
	 	}
	}
	
	public String getDate() {			// 현재 서버의 시간을나타냄
		String SQL = "Select now()";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);	//날짜를 그대로 반환
			}

		} catch (Exception e) {
			e.printStackTrace();		
		}
		return "";	// 데이터베이스 오류
	}
	
	public int getNext() {			// 게시물 번호
		String SQL = "Select bbsID from BBS order by bbsID desc";
		try {								// 내림차순으로 순서부여 하려고 
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;	//작성 될때마다 게시물 번호가 1씩 증가
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return -1;	// 데이터베이스 오류 - 게시물 번호인 -1이 적합하지 않으므로 오류발생인것을 알 수 있다.
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "insert into BBS values (?,?,?,?,?,?)";
		try {								
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);		// bbsAvailable 이라서 삭제여부 1,0으로 판단, 
									// 이때 작성은 삭제가 안된 상태기떄문에 1
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return -1;	// 데이터베이스 오류
	}
	
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "Select * from BBS where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {								// bbsID 내림차순으로 위에서 10개까지만 순서부여
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10); 
			// 물음표에 들어갈 숫자
			// 만약 게시글이 5개라면, getNext()에는 다음숫자인 6이 온다 
			// 즉, 6보다 작은 숫자인 1~5까지만 다 모든글자가 나오게 되고 
			// 특정한 페이지에서10개만큼 게시글이 나오도록 특정함수를 만든 
			rs=pstmt.executeQuery();
				
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);	// 10개 뽑아온, 게시글 리스트를 저장
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return list;	
	}
	
	public boolean nextPage(int pageNumber) {	// 페이징 처리를 위해서 만듬
		String SQL = "Select * from BBS where bbsID < ? and bbsAvailable = 1";
		try {								
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10); 
			rs=pstmt.executeQuery();
			if(rs.next()) {	
				return true;		// true 다음페이지로 넘어갈수 있다는 것을 알려줌
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return false;
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "Select * from BBS where bbsID = ?";
		try {								
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,bbsID); 
			rs=pstmt.executeQuery();
			if(rs.next()) {	
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return null;
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "update BBS set bbsTitle = ?, bbsContent = ? where bbsID = ?";
		try {								
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return -1;	// 데이터베이스 오류
	}
	
	public int delete(int bbsID) {
		String SQL = "update BBS set bbsAvailable = 0 where bbsID = ?";
		try {								
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return -1;	// 데이터베이스 오류
	}
}

