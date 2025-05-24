package AdminPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

public class DBConnection {
	private static final Logger logger = Logger.getLogger(DBConnection.class.getName());
	private static String url = "jdbc:mysql://localhost:3306/notices";
	private static String user = "root";
	private static String pass = "123jayavi123";
	private static Connection con;
	
	private static DBConnection instance; //private static instance- singleton
	
	private DBConnection() { //private constructor- singleton
		try {
			Class.forName("com.mysql.jdbc.Driver");
			logger.info("MySQL JDBC Driver loaded successfully");
		} catch (ClassNotFoundException e) {
			logger.log(Level.SEVERE, "MySQL JDBC Driver not found. Please ensure mysql-connector-java-5.1.48-bin.jar is in WEB-INF/lib", e);
		}
	}
	
	public Connection getConnection() throws SQLException {
		try {
			if (con == null || con.isClosed()) {
				con = DriverManager.getConnection(url, user, pass);
				logger.info("Database connection established successfully!");
			}
		} catch (SQLException e) {
			logger.log(Level.SEVERE, "Database connection failed", e);
			throw e;
		}
		return con;
	}
	
	public void closeConnection() {
		if (con != null) {
			try {
				con.close();
				logger.info("Database connection closed successfully!");
			} catch (SQLException e) {
				logger.log(Level.WARNING, "Error closing database connection", e);
			}
		}
	}
	
	public static synchronized DBConnection getInstance() { //public static getter -singleton
		if (instance == null) {
			instance = new DBConnection();
		}
		return instance;
	}
}
