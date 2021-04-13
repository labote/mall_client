package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mall.client.commons.DBUtil;
import mall.client.vo.Client;

public class ClientDao {
	
	private DBUtil dbUtil;
	
	public Client login(Client client) {
		this.dbUtil = new DBUtil();
		Client returnClient = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT client_mail clientMail FROM client WHERE client_mail=? AND client_pw=PASSWORD(?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientMail());
			stmt.setString(2, client.getClientPw());
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				returnClient = new Client();
				returnClient.setClientMail(rs.getString("clientMail"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return returnClient;
	}
}
