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
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(ChangePasswordServlet.class.getName());
	private UserController userController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
			// Get form data
			String currentPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			String confirmPassword = request.getParameter("confirmPassword");
			
			// Validate input
			if (!isValidPassword(currentPassword) || !isValidPassword(newPassword)) {
				request.setAttribute("error", "Invalid password format");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			
			// Check if current password is correct
			if (!user.getPassword().equals(currentPassword)) {
				request.setAttribute("error", "Current password is incorrect");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			
			// Check if new passwords match
			if (!newPassword.equals(confirmPassword)) {
				request.setAttribute("error", "New passwords do not match");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			
			// Update password in database
			boolean success = userController.updatePassword(user.getUserId(), newPassword);
			
			if (success) {
				// Update session
				user.setPassword(newPassword);
				session.setAttribute("user", user);
				response.sendRedirect("Profile.jsp?message=Password updated successfully");
			} else {
				request.setAttribute("error", "Failed to update password");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Error changing password", e);
			request.setAttribute("error", "An error occurred while changing password");
			request.getRequestDispatcher("Profile.jsp").forward(request, response);
		}
	}

	private boolean isValidPassword(String password) {
		// Password must be at least 8 characters long and include letters, numbers, and special characters
		return password != null && password.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$");
	}
}
