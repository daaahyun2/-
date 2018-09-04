package member;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.util.ArrayList;

import member.DatabaseUtil;



public class MemberManager {

	private Connection conn;

	private PreparedStatement pstmt;

	private ResultSet rs;

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/mysql";
			String dbID = "root";
			String dbPassword = "12345";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//id 체크
		public boolean checkId(String id){
			boolean b = false;
			try {
				String sql = "select id from webshop_member where id like ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				b=rs.next();
			} catch (Exception e) {
				System.out.println("checkId err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return b;
		}
		
		//회원가입
		public boolean insertData(MemberBean bean){
			boolean b = false;
			try {
				String sql = "insert into webshop_member values(?,?,?,?,?,?,?,?)";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getWname());
				pstmt.setString(3, bean.getPass());
				pstmt.setString(4, bean.getMail());
				pstmt.setString(5, bean.getPhone());
				pstmt.setString(6, bean.getZipcode());
				pstmt.setString(7, bean.getAddress());
				pstmt.setString(8, bean.getJob());
				if(pstmt.executeUpdate()>0)b=true;

			} catch (Exception e) {
				System.out.println("insertData err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return b;
		}

		//로그인용 데이터 탐색
		public String login(String id, String pass){
			String str="";
			try {
				String sql = "select id, wname from webshop_member where id=? and pass=?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass); 
				rs = pstmt.executeQuery();
				if(rs.next()) str=rs.getString("wname");

			} catch (Exception e) {
				System.out.println("login err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return str;
		}
		
		//회원 수정 - 회원 정보 가저오기
		public MemberDto getData(String id){
			MemberDto dto = null;
			try {
				String sql = "select id, pass, wname, mail, phone, zipcode, address, job from webshop_member where id like ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					dto = new MemberDto();
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setWname(rs.getString("wname"));
					dto.setMail(rs.getString("mail"));
					dto.setPhone(rs.getString("phone"));
					dto.setZipcode(rs.getString("zipcode"));
					dto.setAddress(rs.getString("address"));
					dto.setJob(rs.getString("job"));
				}
				
			} catch (Exception e) {
				System.out.println("getData err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return dto;
		}

		//회원정보 수정 - 수정하기
		public boolean modifyData(MemberBean bean){
			boolean b = false;
			try {
				String sql = "update webshop_member set pass=?,wname=?, mail=?, phone=?, zipcode=?, address=?, job=? where id=?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getPass());
				pstmt.setString(2, bean.getWname());
				pstmt.setString(3, bean.getMail());
				pstmt.setString(4, bean.getPhone());
				pstmt.setString(5, bean.getZipcode());
				pstmt.setString(6, bean.getAddress());
				pstmt.setString(7, bean.getJob());
				pstmt.setString(8, bean.getId());
				if(pstmt.executeUpdate()>0) b=true;
			} catch (Exception e) {
				System.out.println("modifyData err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return b;
		}


		//회원 탈퇴 - 비밀번호 확인
		public boolean deleteConfirm(String id, String passwd){
			boolean b = false;
			try {
				String sql = "select * from webshop_member where id = ? and pass = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, passwd);
				rs = pstmt.executeQuery();
				if(rs.next()) b = true;
				
			} catch (Exception e) {
				System.out.println("deleteConfirm err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return b;
		}

		//회원 탈퇴 - 탈퇴하기
		public boolean deleteData(String id){
			boolean b = false;
			try {
				String sql = "delete from webshop_member where id = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				int re = pstmt.executeUpdate();
				if(re>0) b = true;
				
			} catch (Exception e) {
				System.out.println("deleteData err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return b;
		}
		
		//관리자 로그인
		public boolean admin_login(String admin_id,String admin_pass){
			boolean b = false;
			try {
				String sql = "select * from admin where admin_id = ? and admin_pass = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, admin_id);
				pstmt.setString(2, admin_pass);
				rs = pstmt.executeQuery();
				b=rs.next();
			} catch (Exception e) {
				System.out.println("admin_login err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			
			return b;
		}
		
		//관리자 - 회원목록 전체 출력
		public ArrayList<MemberDto> getMemberAll(){
			ArrayList<MemberDto> list = new ArrayList<MemberDto>();
			try {
				String sql = "select * from webshop_member";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					MemberDto dto =  new MemberDto();
					dto.setId(rs.getString("id"));
					dto.setWname(rs.getString("wname"));
					dto.setMail(rs.getString("mail"));
					dto.setPhone(rs.getString("phone"));
					list.add(dto);
				}
			} catch (Exception e) {
				System.out.println("getMemberAll err : ");
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return list;
		}


	}