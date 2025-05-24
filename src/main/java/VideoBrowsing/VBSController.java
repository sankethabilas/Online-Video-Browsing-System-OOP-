package VideoBrowsing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;


public class VBSController {
	
	//connect db
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//insert data function
	public static boolean insertdata(String videoFile, String title, String description, String category, String tags, String mature) throws SQLException {
		String sql = "INSERT INTO videos (videoFile, title, description, category, tags, mature) VALUES (?, ?, ?, ?, ?, ?)";
		
		//create a database connection and SQL statement using try-with-resources to auto-close both
		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, videoFile);
			pstmt.setString(2, title);
			pstmt.setString(3, description);
			pstmt.setString(4, category);
			pstmt.setString(5, tags);
			pstmt.setString(6, mature);
			
			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
			
		} catch (SQLException e) {
			throw e;
		}
	}
	
	
	
	
	
	//display data function
	
	
	//retrieve video details by video ID from the database
	public static List<VBSModel> getById (String Video_id){
		
		int convertedID = Integer.parseInt(Video_id);
		
		ArrayList <VBSModel> VBS = new ArrayList<>();
		
		try {
			//DBConnection
			con= DBConnection.getConnection();
			stmt = con.createStatement();
			
			//query
			
			String sql = "SELECT * FROM videos WHERE video_id = " + convertedID;

			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				// Extract data from each column in the current row
				int video_id = rs.getInt(1);
				String videoFile = rs.getString(2);
				String title = rs.getString(3);
				String description = rs.getString(4);
				String category = rs.getString(5);
				String tags = rs.getString(6);
				String mature = rs.getString(7);
				
				//Create a VBSModel object with the data
				VBSModel vb = new VBSModel(video_id, videoFile, title, description,category, tags, mature);
				VBS.add(vb);
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
	return VBS;
  }


//get all data 
	
	//retrieve all video records from the database
	public static List<VBSModel> getAllData() {
		//store all video records retrieved from the database
		ArrayList<VBSModel> videoList = new ArrayList<>();
		String sql = "SELECT * FROM videos";
		
		// Use try-with-resources to auto-close Connection, PreparedStatement, and ResultSet
		try (Connection con = DBConnection.getConnection();
			 PreparedStatement stmt = con.prepareStatement(sql);
			 ResultSet rs = stmt.executeQuery()) {
			
			while(rs.next()) {
				int video_id = rs.getInt("video_id");
				String videoFile = rs.getString("videoFile");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String category = rs.getString("category");
				String tags = rs.getString("tags");
				String mature = rs.getString("mature");
				
				// Create a VBSModel object with the retrieved data
				VBSModel vb = new VBSModel(video_id, videoFile, title, description, category, tags, mature);
				videoList.add(vb);
		}
			
	} catch(Exception e) {
		// Handle any exceptions
		e.printStackTrace();
	}
	
	return videoList;
}



//updateing data

	public static boolean updateData(String video_id, String title, String description, String category, String tags, String mature) {
    boolean isSuccess = false;

    try {
    	
    	// Establish a connection to the database
        con = DBConnection.getConnection();
        String sql = "UPDATE videos SET title = ?, description = ?, category = ?, tags = ?, mature = ? WHERE video_id = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);

        pstmt.setString(1, title);
        pstmt.setString(2, description);
        pstmt.setString(3, category);
        pstmt.setString(4, tags);
        pstmt.setString(5, mature);
        pstmt.setInt(6, Integer.parseInt(video_id));

        // Execute the update query and get number of affected rows
        int rowsAffected = pstmt.executeUpdate();
        isSuccess = (rowsAffected > 0);

        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return isSuccess;
}



//delete data

	//Method to delete a video record from the 'videos' table
	public static boolean deletedata(String video_id) {
	int convID = Integer.parseInt(video_id);
	
	try {
		//DBConnection
		con=DBConnection.getConnection();
		// Create a Statement object to execute the SQL command
		stmt=con.createStatement();
		
		String sql = "delete from videos where video_id ='"+convID+"'";
		
		// Execute the delete query and get the number of affected rows
		int rs = stmt.executeUpdate(sql);
		if(rs>0) {
			isSuccess =true;
		}
		
		else {
			isSuccess = false;
		}
	}
	
	catch(Exception e) {
		e.printStackTrace(); 
	}
	
	return isSuccess;
}

}	
