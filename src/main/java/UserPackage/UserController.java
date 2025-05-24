package UserPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;


public class UserController {
	
	// Register user
		public boolean registerUser(UserModel.User user) {
			String query = "INSERT INTO users (first_name, last_name, username, email, password, user_type) VALUES (?, ?, ?, ?, ?, ?)";
			boolean success = false;

			try (Connection conn = DBConnection.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(query)) {
				
				pstmt.setString(1, user.getFirstName());
				pstmt.setString(2, user.getLastName());
				pstmt.setString(3, user.getUsername());
				pstmt.setString(4, user.getEmail());
				pstmt.setString(5, user.getPassword());
				pstmt.setString(6, user.getUserType() != null ? user.getUserType() : "user");

				int rowsAffected = pstmt.executeUpdate();
				success = rowsAffected > 0;
			} catch (Exception e) {
				e.printStackTrace();
			}

			return success;
		}
		
		
		// Login user
		public List<UserModel.User> loginUser(String email, String password) {
			List<UserModel.User> users = new ArrayList<>();
			String query = "SELECT user_id, first_name, last_name, username, email, password, profile_picture, user_type FROM users WHERE email = ? AND password = ?";

			try (Connection conn = DBConnection.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(query)) {
				
				pstmt.setString(1, email);
				pstmt.setString(2, password);

				try (ResultSet rs = pstmt.executeQuery()) {
					if (rs.next()) {
						UserModel.User user = new UserModel.User();
						user.setUserId(rs.getString("user_id"));
						user.setFirstName(rs.getString("first_name"));
						user.setLastName(rs.getString("last_name"));
						user.setUsername(rs.getString("username"));
						user.setEmail(rs.getString("email"));
						user.setPassword(rs.getString("password"));
						user.setProfilePicture(rs.getString("profile_picture"));
						user.setUserType(rs.getString("user_type"));
						users.add(user);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return users;
		}

    // Update profile picture
    public boolean updateProfilePicture(String userId, String profilePicturePath) {
        String query = "UPDATE users SET profile_picture = ? WHERE user_id = ?";
        boolean success = false;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, profilePicturePath);
            pstmt.setString(2, userId);

            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // Update profile information
    public boolean updateProfile(UserModel.User user) {
        String query = "UPDATE users SET first_name = ?, last_name = ?, username = ? WHERE user_id = ?";
        boolean success = false;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getUsername());
            pstmt.setString(4, user.getUserId());

            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // Update password
    public boolean updatePassword(String userId, String newPassword) {
        String query = "UPDATE users SET password = ? WHERE user_id = ?";
        boolean success = false;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, newPassword);
            pstmt.setString(2, userId);

            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // Delete account
    public boolean deleteAccount(String userId) {
        String query = "DELETE FROM users WHERE user_id = ?";
        boolean success = false;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, userId);

            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<UserModel.User> getAllUsers() {
        List<UserModel.User> users = new ArrayList<>();
        String query = "SELECT * FROM users ORDER BY first_name";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            
            System.out.println("Fetching users from database...");
            while (rs.next()) {
                UserModel.User user = new UserModel.User();
                user.setUserId(rs.getString("user_id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setUserType(rs.getString("user_type"));
                user.setProfilePicture(rs.getString("profile_picture"));
                users.add(user);
                System.out.println("Added user: " + user.getFirstName() + " " + user.getLastName());
            }
            System.out.println("Total users fetched: " + users.size());
        } catch (Exception e) {
            System.err.println("Error fetching users: " + e.getMessage());
            e.printStackTrace();
        }
        
        return users;
    }

}
