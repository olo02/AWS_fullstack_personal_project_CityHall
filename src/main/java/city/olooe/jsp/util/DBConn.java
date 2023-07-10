package city.olooe.jsp.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://np.olooe.city:3306/city2", "SAMPLE", "1234");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
}
