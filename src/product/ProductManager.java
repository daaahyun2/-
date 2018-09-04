package product;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.DatabaseUtil;
import order.OrderBean;

public class ProductManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ProductManager() {
		try {
	 		String dbURL = "jdbc:mysql://localhost:3306/mysql";
	 		String dbID = "root";
	 		String dbPassword = "12345";
	 		Class.forName("com.mysql.jdbc.Driver");
	 		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	 	} catch (Exception e) {
	 	}
	 	System.out.println("dddd");
	}
	
	//전체 상품 목록 출력
	public ArrayList<ProductDto> getProductAll(){
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		try {
			String sql = "select * from webshop_product";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ProductDto dto = new ProductDto();
				dto.setPno(rs.getString("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setDetail(rs.getString("detail"));
				dto.setPrice(rs.getString("price"));
				dto.setSdate(rs.getString("date"));
				dto.setImage(rs.getString("image"));
				dto.setStock(rs.getString("stock"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getProductAll err : " + e);
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
	
	//상품상세보기
	public ProductDto getProduct(String pno){
		ProductDto dto = null;
		try {
			String sql = "select * from webshop_product where pno = ?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new ProductDto();
				dto.setPno(rs.getString("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPrice(rs.getString("price"));
				dto.setDetail(rs.getString("detail"));
				dto.setSdate(rs.getString("date"));
				dto.setStock(rs.getString("stock"));
				dto.setImage(rs.getString("image"));
			}
		} catch (Exception e) {
			System.out.println("getProduct err : ");
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
	
	//주문 시  재고량 수정
	public void reduceProduct(OrderBean bean){
		try {
			String sql = "update webshop_product set stock=(stock-?) where pno=?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getQuantity());
			pstmt.setString(2, bean.getProduct_no());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("reduceProduct err : " + e);
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

	//미리보기 파일 삽입
		public String insertPreviewImg(HttpServletRequest request){
			String imageName = "noImage.jsp";
			try {
				//파일 저장 경로
				ServletContext context = request.getSession().getServletContext();
				String fileDir = context.getRealPath("/images/preview");

				//파일 저장
				MultipartRequest multi = new MultipartRequest(
						request,  //객체
						fileDir,  //저장경로 
						5 * 1024 * 1024,  //파일 최대 크기
						"UTF-8"   //파일 인코딩
				);
				
				//이미지가 있을 경우, 리턴값 설정
				if(multi.getFilesystemName("image")!=null)
					//저장된 미리보기 파일명 출력
					imageName = multi.getFilesystemName("image");
				
			} catch (Exception e) {
				System.out.println("previewImage err : " + e);
			} 
			return imageName;
		}
		
		//미리보기 파일 삭제
		public void deletePreviewImg(HttpServletRequest request){
			//파일 경로
			ServletContext context = request.getSession().getServletContext();
			String fileDir = context.getRealPath("/images/preview");
			
			//preview 폴더 내용은 유지할 필요가 없기 때문에 상시로 비워줌
			File file = new File(fileDir);
			if(file.isDirectory()){
				for(File f:file.listFiles()){
					f.delete();
				}
			}
		}
		
		//제품 추가
		public boolean insertProduct(HttpServletRequest request){
			boolean b = false;
			try {

				//웹의 루트경로
				ServletContext context = request.getSession().getServletContext();
				String uploadDir = context.getRealPath("/images/product");

				//파일 저장
				MultipartRequest multi = new MultipartRequest(
						request,  //객체
						uploadDir,  //저장경로 
						5 * 1024 * 1024,  //파일 최대 크기
						"UTF-8",   //파일 인코딩
						new DefaultFileRenamePolicy() //중복 파일 처리 인터페이스
				);

				//데이터베이스 처리
				String sql = "insert into webshop_product(pname,price,detail,date,stock,image) "
						+ "values (?,?,?,now(),?,?)";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("pname"));
				pstmt.setString(2, multi.getParameter("price"));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setString(4, multi.getParameter("stock"));
				//이미지가 없을 경우, 준비중 이미지로 대체
				if(multi.getFilesystemName("image")==null){
					pstmt.setString(5, "noimage.jpg");
				} else {
					pstmt.setString(5, multi.getFilesystemName("image"));
				}

				if(pstmt.executeUpdate()>0)b=true;
			} catch (Exception e) {
				System.out.println("insertProduct err : " + e);
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
		
		//제품 수정
		public boolean updateProduct(HttpServletRequest request){
			boolean b=false;
			try {

				//웹의 루트경로
				ServletContext context = request.getSession().getServletContext();
				String uploadDir = context.getRealPath("/images/product");

				//파일 저장
				MultipartRequest multi = new MultipartRequest(
						request,  //객체
						uploadDir,  //저장경로 
						5 * 1024 * 1024,  //파일 최대 크기
						"UTF-8",   //파일 인코딩
						new DefaultFileRenamePolicy() //중복 파일 처리 인터페이스
				);
				conn = DatabaseUtil.getConnection();
				//이미지가 수정되지 않았을 경우
				if(multi.getFilesystemName("image")==null){
					String sql = "update webshop_product set pname=?, price=?, detail=?, stock=? where pno=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("pname"));
					pstmt.setString(2, multi.getParameter("price"));
					pstmt.setString(3, multi.getParameter("detail"));
					pstmt.setString(4, multi.getParameter("stock"));
					pstmt.setString(5, multi.getParameter("pno"));
				} else {
					String sql = "update webshop_product set pname=?, price=?, detail=?, stock=?, image=? where pno=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("pname"));
					pstmt.setString(2, multi.getParameter("price"));
					pstmt.setString(3, multi.getParameter("detail"));
					pstmt.setString(4, multi.getParameter("stock"));
					pstmt.setString(5, multi.getFilesystemName("image"));
					pstmt.setString(6, multi.getParameter("pno"));
				}
				if(pstmt.executeUpdate()>0)b=true;

			} catch (Exception e) {
				System.out.println("updateProduct err : " + e);
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
		
		//제품 삭제
		public boolean deleteProduct(String pno){
			boolean b=false;
			try {
				String sql = "delete from webshop_product where pno=?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pno);
				if(pstmt.executeUpdate()>0)b=true;
				
			} catch (Exception e) {
				System.out.println("deleteProduct err : " +e);
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
