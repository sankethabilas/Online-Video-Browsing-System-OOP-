package VideoBrowsing;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static String url = "jdbc:mysql://localhost:3306/video_browsing_system";
	private static String user = "root";
	private static String pass = "1234";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		
		} catch (Exception e) {
			System.out.println("database not connect ");
			e.printStackTrace();}
			return con;
		
		}
	}

