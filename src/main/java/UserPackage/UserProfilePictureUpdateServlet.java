package UserPackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 * Servlet implementation class UserProfilePictureUpdateServlet
 */
@WebServlet("/UserProfilePictureUpdateServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 5,    // 5 MB
    maxRequestSize = 1024 * 1024 * 10  // 10 MB
)
public class UserProfilePictureUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(UserProfilePictureUpdateServlet.class.getName());
	private static final String UPLOAD_DIRECTORY = "uploads/profiles";
	private UserController userController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfilePictureUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public void init() throws ServletException {
		userController = new UserController();
		// Create upload directory if it doesn't exist
		createUploadDirectory();
	}
	
	private void createUploadDirectory() {
		try {
			String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Error creating upload directory", e);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("Login.jsp");
			return;
		}
		
		UserModel.User user = (UserModel.User) session.getAttribute("user");
		String userId = user.getUserId();
		
		try {
			// Get the uploaded file part
			Part filePart = request.getPart("profilePicture");
			if (filePart == null || filePart.getSize() == 0) {
				request.setAttribute("error", "Please select a file to upload");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			
			// Get file information
			String fileName = getSubmittedFileName(filePart);
			String fileExtension = fileName.substring(fileName.lastIndexOf("."));
			
			// Validate file type
			if (!isValidImageFile(fileExtension)) {
				request.setAttribute("error", "Please upload a valid image file (JPG, PNG, GIF)");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			
			// Create unique filename
			String uniqueFileName = userId + "_" + System.currentTimeMillis() + fileExtension;
			
			// Get the upload path
			String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
			Path filePath = Paths.get(uploadPath, uniqueFileName);
			
			// Save the file
			Files.copy(filePart.getInputStream(), filePath);
			
			// Update database with new profile picture path
			String relativePath = UPLOAD_DIRECTORY + "/" + uniqueFileName;
			boolean success = userController.updateProfilePicture(userId, relativePath);
			
			if (success) {
				// Update session with new profile picture
				user.setProfilePicture(relativePath);
				session.setAttribute("user", user);
				
				// Redirect back to profile page with success message
				response.sendRedirect("Profile.jsp?message=Profile picture updated successfully");
			} else {
				// Delete the uploaded file if database update fails
				Files.deleteIfExists(filePath);
				request.setAttribute("error", "Failed to update profile picture");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Error updating profile picture", e);
			request.setAttribute("error", "An error occurred while updating profile picture");
			request.getRequestDispatcher("Profile.jsp").forward(request, response);
		}
	}
	
	private String getSubmittedFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] tokens = contentDisp.split(";");
		for (String token : tokens) {
			if (token.trim().startsWith("filename")) {
				return token.substring(token.indexOf("=") + 2, token.length() - 1);
			}
		}
		return "";
	}
	
	private boolean isValidImageFile(String fileExtension) {
		return fileExtension.equalsIgnoreCase(".jpg") || 
			   fileExtension.equalsIgnoreCase(".jpeg") || 
			   fileExtension.equalsIgnoreCase(".png") || 
			   fileExtension.equalsIgnoreCase(".gif");
	}
}
