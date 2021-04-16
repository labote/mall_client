package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mall.client.commons.DBUtil;
import mall.client.vo.Cart;
import mall.client.vo.Client;

public class CartDao {
	private DBUtil dbUtil;
	
	// 장바구니 목록 전체 제거
	public void deleteCartByClient(String clientMail) {
		// DBUtil, Connection, PreparedStatement, ResultSet 객체 생성
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			// DB 연결 및 SQL문 실행
			conn = this.dbUtil.getConnection();
			String sql = "DELETE FROM cart where client_mail = ?";
			stmt = conn.prepareStatement(sql);
			System.out.println("stmt : " + stmt); // 디버깅
			stmt.setString(1, clientMail);
			stmt.executeUpdate();		
		} catch (Exception e) { // 예외 처리
			e.printStackTrace();
		} finally { // 할당값 해제
			this.dbUtil.close(null, stmt, conn);
		}
	}
	
	// 장바구니 목록 제거
	public void deleteCart(int cartNo) {
		// dbutil, rowCnt, conn, stmt 객체 생성 및 초기화
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			// DB 연결 및 SQL문 실행
			conn = this.dbUtil.getConnection();
			String sql = "DELETE FROM cart where cart_no = ?";
			stmt = conn.prepareStatement(sql);
			System.out.println("stmt : " + stmt); // 디버깅
			stmt.setInt(1, cartNo);
			stmt.executeUpdate();		
		} catch (Exception e) { // 예외 처리
			e.printStackTrace();
		} finally { // 할당값 해제
			this.dbUtil.close(null, stmt, conn);
		}
	}
	
	// 장바구니 중복 체크
	public boolean selectClientMail(Cart cart) {
		// dbutil, rowCnt, conn, stmt 객체, flag 초기화
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean flag = true; // 중복 없음
		
		try {
			// DB 연결 및 SQL문 실행
			conn = this.dbUtil.getConnection();
			String sql = "SELECT * FROM cart WHERE client_mail =? AND ebook_no = ?";
			stmt = conn.prepareStatement(sql);
			System.out.println("stmt : " + stmt); // 디버깅
			stmt.setString(1, cart.getClientMail());
			stmt.setInt(2, cart.getEbookNo());
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				flag = false; // 중복 있음
			}
		} catch (Exception e) { // 예외 처리
			e.printStackTrace();
		} finally { // 할당값 해제
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return flag;
	}
	
	// Cart insert 메서드
	public int insertCart(Cart cart) {
			
		// DBUtil, Connection, PreparedStatement, rowCnt 객체 생성 및 초기화
		
		this.dbUtil = new DBUtil();
		int rowCnt = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			// DB 연결 및 SQL문 실행
			conn = this.dbUtil.getConnection();
			String sql = "INSERT INTO cart(client_mail, ebook_no, cart_date) VALUES(?, ?, NOW())";
			stmt = conn.prepareStatement(sql);
			System.out.println("stmt : " + stmt); // 디버깅
			stmt.setString(1, cart.getClientMail());
			stmt.setInt(2, cart.getEbookNo());
			rowCnt = stmt.executeUpdate();
			
		} catch (Exception e) { // 예외 처리
			e.printStackTrace();
		} finally { // 할당값 해제
			this.dbUtil.close(null, stmt, conn);
		}
		
			return rowCnt;
	}
	
	public List<Map<String,Object>> selectCartList(String clientMail) {
		/*
		 *  SELECT 
		 * 		c.cart_no, 
				e.ebook_no, 
				e.ebook_title, 
				c.cart_date
			FROM cart c INNER JOIN ebook e
			ON c.ebook_no = e.ebook_no
		 * 
		 */
		// List, DBUtil, Connection, PreparedStatement, ResultSet 객체 생성
		List<Map<String,Object>> list = new ArrayList<>();
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbUtil.getConnection();
			// 고객의 장바구니 정보를 불러온다.
			String sql = "SELECT c.cart_no cartNo, e.ebook_no ebookNo, e.ebook_title ebookTitle, date_format(c.cart_date,'%Y-%m-%d') cartDate FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no WHERE c.client_mail = ?";
			stmt = conn.prepareStatement(sql);
			System.out.println("stmt : " + stmt); // 디버깅
			stmt.setString(1, clientMail);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("cartNo", rs.getInt("cartNo"));
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("cartDate", rs.getString("cartDate"));
				list.add(map);
			} 
		} catch (Exception e) { // 예외 처리
			e.printStackTrace();
		} finally { // 할당 해제
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return list;
	}
}
