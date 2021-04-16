package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mall.client.commons.DBUtil;
import mall.client.vo.Orders;

public class OrdersDao {
	private DBUtil dbUtil;
	
	public List<Map<String, Object>> selectOrdersListByClient(int clientNo){
		// list, conn, stmt, rs 객체 생성 및 초기화
		List<Map<String,Object>> list = new ArrayList<>(); // 다형성
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			// DB 연결 및 SQL문 실행
			conn = this.dbUtil.getConnection();
			String sql = "SELECT o.orders_no ordersNo, o.ebook_no ebookNo, o.orders_date ordersDate, o.orders_state ordersState, e.ebook_title ebookTitle, e.ebook_price ebookPrice FROM orders o INNER JOIN ebook e ON o.ebook_no = e.ebook_no WHERE o.client_no = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, clientNo);
			System.out.println("stmt(selectOrdersListByClient) : " + stmt); // 디버깅
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String,Object> map = new HashMap<>();
				map.put("ordersNo", rs.getInt("ordersNo"));
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ordersDate", rs.getString("ordersDate"));
				map.put("ordersState", rs.getString("ordersState"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("ebookPrice", rs.getInt("ebookPrice"));
				list.add(map);
			}
		} catch(Exception e) { // 예외 처리
			// 시스템을 멈추고 함수호출스택구조를 콘솔에 출력
			e.printStackTrace();
		} finally { // 할당 해제
			dbUtil.close(null, stmt, conn);
		}
		
		return list;
	}
	
	// insert 메서드
	public int insertOrders(Orders orders) {
		// rowCnt, conn, stmt 객체 생성 및 초기화
		int rowCnt = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			// DB 연결 및 SQL문 실행
			conn = this.dbUtil.getConnection();
			String sql = "INSERT INTO orders(ebook_no, client_no, orders_date, orders_state) VALUES(?,?,NOW(),'주문완료')";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orders.getEbookNo());
			stmt.setInt(2, orders.getClientNo());
			System.out.println("stmt(insertOrders) : " + stmt); // 디버깅
			rowCnt = stmt.executeUpdate();
		} catch(Exception e) { // 예외 처리
			// 시스템을 멈추고 함수호출스택구조를 콘솔에 출력
			e.printStackTrace();
		} finally { // 할당 해제
			dbUtil.close(null, stmt, conn);
		}
		
		return rowCnt;
	}
}