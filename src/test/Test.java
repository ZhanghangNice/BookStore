package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.zh.util.Dbcp;

public class Test {

	public static void main(String[] args) {
		System.out.println("XXXXXXXXXXXXXXX");
		Test t = new Test();
		t.testdb();
	}
	
	public void testdb() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			System.out.println(con.getClientInfo(null));
			System.out.println("************************");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
	}
}
