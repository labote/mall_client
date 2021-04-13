package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mall.client.commons.DBUtil;

public class CartDao {
	private DBUtil dbUtil;
	
	public List<Map<String,Object>> selectCartList(String clientMail) {
		List<Map<String,Object>> list = new ArrayList<>();
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
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		// 고객의 장바구니 정보를 불러온다.
		String sql = "SELECT c.cart_no cartNo, e.ebook_no ebookNo, e.ebook_title ebookTitle, c.cart_date cartDate FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no WHERE c.client_mail = ?";
		
		try {
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//this.dbUtil.close(rs, stmt, conn);
		}
		
		return list;
	}
}
