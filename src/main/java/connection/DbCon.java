package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		try {
			if (connection == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dance_company", "root", "6866");
				System.out.print("connected");
			}
			return connection;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.out.println("couldn't connect!");
			throw new RuntimeException(ex);
		}
	}
}
