package AdminPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;
import java.util.logging.Level;

public class noticesControl {
    private static final Logger logger = Logger.getLogger(noticesControl.class.getName());

    public static boolean insertData(String title, String message) {
        boolean isSuccess = false;

        try (Connection con = DBConnection.getInstance().getConnection()) {
            if (con == null) {
                logger.severe("Database connection is null!");
                return false;
            }

            String sql = "INSERT INTO notices (title, message) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, message);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
                logger.info("Notice inserted successfully.");
            } else {
                logger.warning("Failed to insert notice. No rows affected.");
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during database insertion: " + e.getMessage(), e);
        }

        return isSuccess;
    }
    
    //update data
    public static boolean updatedata(int id, String title, String message) {
        boolean isSuccess = false;
        logger.info("Attempting to update notice with ID: " + id);
        logger.info("New title: " + title);
        logger.info("New message: " + message);
        
        try (Connection con = DBConnection.getInstance().getConnection()) {
            if (con == null) {
                logger.severe("Database connection is null!");
                return false;
            }

            String sql = "UPDATE notices SET title = ?, message = ? WHERE id = ?";
            logger.info("SQL Query: " + sql);
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, message);
            ps.setInt(3, id);

            logger.info("Executing update...");
            int rowsAffected = ps.executeUpdate();
            logger.info("Rows affected: " + rowsAffected);
            
            if (rowsAffected > 0) {
                isSuccess = true;
                logger.info("Notice updated successfully. ID: " + id);
            } else {
                logger.warning("Failed to update notice. No rows affected. ID: " + id);
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during database update: " + e.getMessage(), e);
        }
        return isSuccess;
    }
}
