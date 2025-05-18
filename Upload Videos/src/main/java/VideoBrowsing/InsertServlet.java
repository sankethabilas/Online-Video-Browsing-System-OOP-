package VideoBrowsing;

import java.io.File;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Part filePart = request.getPart("videoFile");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

			// Save directly to webapp/videos folder
			String uploadPath = "C:/Users/ADMIN/Desktop/OOP Project/Online Video Browsing System/src/main/webapp/videos";
			
			// Create videos directory if it doesn't exist
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			// Save the file
			String finalPath = uploadPath + "/" + fileName;
			filePart.write(finalPath);
			
			System.out.println("File saved to: " + finalPath);
			
			// Verify file exists
			File uploadedFile = new File(finalPath);
			if(uploadedFile.exists()) {
				System.out.println("File successfully saved!");
				System.out.println("File size: " + uploadedFile.length() + " bytes");
			}
			
			String videoFile = "videos/" + fileName;
			
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			String category = request.getParameter("category");
			String tags = request.getParameter("tags");
			
			String mature = request.getParameter("mature");
			if (mature != null) {
				mature = "Y";  // Checked
			} else {
				mature = "N";  // Not checked
			}
			
			boolean isTrue;
			
			isTrue = VBSController.insertdata(videoFile,title,description,category,tags,mature);
		
			if(isTrue == true) {
				String alertMessage = "Data insert successful. File saved at: " + finalPath;
				response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllServlet';</script>");
			} else {
				RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
				dis2.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error uploading file: " + e.getMessage());
			request.getRequestDispatcher("wrong.jsp").forward(request, response);
		}
	}
}
