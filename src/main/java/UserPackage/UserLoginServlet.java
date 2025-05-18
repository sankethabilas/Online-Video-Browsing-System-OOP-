package UserPackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(UserLoginServlet.class.getName());
	private UserController userController;
	
	@Override
	public void init() throws ServletException {
		userController = new UserController();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Check if user is already logged in
		HttpSession session = request.getSession(false);
		
		if (session != null && session.getAttribute("user") != null) {
	
			response.sendRedirect("Home.jsp");
			return;
		}
		
		// Redirect GET requests to login page
		response.sendRedirect("Login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");
		
		try {
			// Validate input
			if (!validateInput(email, password)) {
				request.setAttribute("error", "Please enter both email and password");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				return;
			}
			
			// Attempt login
			List<UserModel.User> userLogin = userController.loginUser(email, password);
			
			if (userLogin != null && !userLogin.isEmpty()) {
				UserModel.User user = userLogin.get(0);
				
				// Create new session
				HttpSession oldSession = request.getSession(false);
				if (oldSession != null) {
					oldSession.invalidate();
				}
				HttpSession newSession = request.getSession(true);
				
				// Set session attributes
				newSession.setAttribute("user", user);
				newSession.setAttribute("username", user.getUsername());
				newSession.setAttribute("firstName", user.getFirstName());
				newSession.setAttribute("userType", user.getUserType());
				
				// Set session timeout to 30 minutes
				newSession.setMaxInactiveInterval(30 * 60);
				
				// Handle remember me
				if (rememberMe != null && rememberMe.equals("on")) {
					Cookie userCookie = new Cookie("userEmail", email);
					userCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days
					userCookie.setPath("/");
					userCookie.setHttpOnly(true);
					response.addCookie(userCookie);
				}
				
				// Log successful login
				logger.info("User logged in successfully: " + email);
				
				// Redirect to appropriate page based on user type
				if ("admin".equalsIgnoreCase(user.getUserType())) {
					response.sendRedirect("Admin.jsp");
				} else {
					response.sendRedirect("Home.jsp");
				}
			} else {
				// Log failed login attempt
				logger.warning("Failed login attempt for email: " + email);
				
				request.setAttribute("error", "Invalid email or password. Please try again.");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Error during login process", e);
			request.setAttribute("error", "An error occurred during login. Please try again later.");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}
	
	private boolean validateInput(String email, String password) {
		if (email == null || password == null) {
			return false;
		}
		
		email = email.trim();
		password = password.trim();
		
		if (email.isEmpty() || password.isEmpty()) {
			return false;
		}
		
		// Basic email format validation
		if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
			return false;
		}
		
		return true;
	}
}
