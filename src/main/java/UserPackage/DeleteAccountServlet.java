package UserPackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 * Servlet implementation class DeleteAccountServlet
 */
@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(DeleteAccountServlet.class.getName());
	private UserController userController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() {
        userController = new UserController();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("Login.jsp");
			return;
		}
		
		UserModel.User user = (UserModel.User) session.getAttribute("user");
		
		try {
			// Get password for verification
			String password = request.getParameter("password");
			
			// Verify password
			if (!user.getPassword().equals(password)) {
				request.setAttribute("error", "Incorrect password");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			
			// Delete user's profile picture if exists
			if (user.getProfilePicture() != null && !user.getProfilePicture().isEmpty()) {
				String uploadPath = getServletContext().getRealPath("") + user.getProfilePicture();
				java.io.File profilePicture = new java.io.File(uploadPath);
				if (profilePicture.exists()) {
					profilePicture.delete();
				}
			}
			
			// Delete account from database
			boolean success = userController.deleteAccount(user.getUserId());
			
			if (success) {
				// Invalidate session
				session.invalidate();
				response.sendRedirect("Login.jsp?message=Account deleted successfully");
			} else {
				request.setAttribute("error", "Failed to delete account");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Error deleting account", e);
			request.setAttribute("error", "An error occurred while deleting account");
			request.getRequestDispatcher("Profile.jsp").forward(request, response);
		}
	}

}
