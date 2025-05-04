package controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
    private static final String URL = "jdbc:mysql://localhost:3306/contact";
    private static final String USER = "root";  
    private static final String PASSWORD = "123456";  
    public static Connection conn;

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); //earlir there was "com.mysql.jc.jdbc.Driver" it was incorrect
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            
        } catch (Exception e) {
        	
           System.out.println("Database is not connected !");
            
        }
        return conn;
    }
}