package VideoBrowsing;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static String url = "jdbc:mysql://localhost:3306/video_browsing_system";
    private static String user = "root";
    private static String pass = "1234";
    private static Connection con;

  
    private DBConnection() {}

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, pass);
            }
            
        } catch (Exception e) {
            System.out.println("Database not connected");
            e.printStackTrace();
        }
        return con;
    }
}
