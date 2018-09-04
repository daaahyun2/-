package order;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;


import member.DatabaseUtil;



public class OrderManager {

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
	
	//주문하기
		public void insertOrder(OrderBean bean){
			try {
				String sql = "insert into webshop_order(product_no, quantity, date, state, id) values(?,?,now(),?,?)";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getProduct_no());
				pstmt.setString(2, bean.getQuantity());
				pstmt.setString(3, "1");
				pstmt.setString(4, bean.getId());
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("insertOrder err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}

		//주문 내역 보기
		public ArrayList<OrderBean> getOrder(String id){
			ArrayList<OrderBean> list = new ArrayList<OrderBean>();
			try {
				String sql = "select * from webshop_order where id=? order by ono desc";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()){
					OrderBean bean = new OrderBean();
					bean.setOno(rs.getString("ono"));
					bean.setProduct_no(rs.getString("product_no"));
					bean.setQuantity(rs.getString("quantity"));
					bean.setSdate(rs.getString("date"));
					bean.setState(rs.getString("state"));
					bean.setId(rs.getString("id"));
					list.add(bean);
				}
				
			} catch (Exception e) {
				System.out.println("getOrder err : " + e);
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
		
		//주문 전체보기
		public ArrayList<OrderBean> getOrderAll(){
			ArrayList<OrderBean> list = new ArrayList<OrderBean>();

			try {
				String sql = "select * from webshop_order";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					OrderBean bean = new OrderBean();
					bean.setOno(rs.getString("ono"));
					bean.setProduct_no(rs.getString("product_no"));
					bean.setQuantity(rs.getString("quantity"));
					bean.setSdate(rs.getString("date"));
					bean.setState(rs.getString("state"));
					bean.setId(rs.getString("id"));
					list.add(bean);
				}
				
			} catch (Exception e) {
				System.out.println("getOrderAll err : " + e);
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

		//주문 상세보기
		public OrderBean getOrderDetail(String ono){
			OrderBean bean = new OrderBean();
			try {
				String sql = "select * from webshop_order where ono = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ono);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bean.setOno(rs.getString("ono"));
					bean.setProduct_no(rs.getString("product_no"));
					bean.setQuantity(rs.getString("quantity"));
					bean.setSdate(rs.getString("date"));
					bean.setState(rs.getString("state"));
					bean.setId(rs.getString("id"));
				}
			} catch (Exception e) {
				System.out.println("getOrderDetail err : " + e);
			} finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return bean;
		}
		
		//주문 상태 수정
		public boolean updateOrder(String ono, String state){
			boolean b = false;
			try {
				String sql = "update webshop_order set state = ? where ono = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, state);
				pstmt.setString(2, ono);
				if(pstmt.executeUpdate()>0)b = true;
				
			} catch (Exception e) {
				System.out.println("updateOrder err : " + e);
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
		
		//주문 삭제
		public boolean deleteOrder(OrderBean bean){
			boolean b = false;
			try {
				conn = DatabaseUtil.getConnection();
				
				//주문 삭제 시 상품 재고량 복귀
				String sql = "update webshop_product set stock = stock+? where pno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getQuantity());
				pstmt.setString(2, bean.getProduct_no());
				if(pstmt.executeUpdate()<=0){
					return false;

				}

				//주문 삭제
				String delsql = "delete from webshop_order where ono=?";
				pstmt = conn.prepareStatement(delsql);
				pstmt.setString(1, bean.getOno());
				if(pstmt.executeUpdate()>0)b = true;
				
			} catch (Exception e) {
				System.out.println("deleteOrder err : " + e);
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


}

