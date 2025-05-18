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
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(UpdateProfileServlet.class.getName());
	private UserController userController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
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
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String username = request.getParameter("username");
			
			// Validate input
			if (!isValidName(firstName) || !isValidName(lastName) || !isValidUsername(username)) {
				request.setAttribute("error", "Invalid input data");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			
			// Update user object
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setUsername(username);
			
			// Update in database
			boolean success = userController.updateProfile(user);
			
			if (success) {
				// Update session
				session.setAttribute("user", user);
				response.sendRedirect("Profile.jsp?message=Profile updated successfully");
			} else {
				request.setAttribute("error", "Failed to update profile");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Error updating profile", e);
			request.setAttribute("error", "An error occurred while updating profile");
			request.getRequestDispatcher("Profile.jsp").forward(request, response);
		}
	}
	
	private boolean isValidName(String name) {
		return name != null && name.matches("[A-Za-z\\s]{2,50}");
	}
	
	private boolean isValidUsername(String username) {
		return username != null && username.matches("[A-Za-z0-9_]{3,20}");
	}
}
