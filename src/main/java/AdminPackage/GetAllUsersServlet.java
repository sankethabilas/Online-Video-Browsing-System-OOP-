package AdminPackage;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import UserPackage.UserModel;
import UserPackage.UserController;

@WebServlet("/GetAllUsers")
public class GetAllUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserController userController;
    
    @Override
    public void init() throws ServletException {
        System.out.println("GetAllUsersServlet initialized");
        userController = new UserController();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("GetAllUsersServlet doGet called");
        try {
            // Get all users from database
            List<UserModel.User> users = userController.getAllUsers();
            System.out.println("Number of users fetched: " + (users != null ? users.size() : 0));
            
            // Set users list as request attribute
            request.setAttribute("users", users);
            
            // Forward to users page
            System.out.println("Forwarding to Users.jsp");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Users.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Error in GetAllUsersServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
} 