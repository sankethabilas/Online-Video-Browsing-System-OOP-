package AdminPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ListNotices")
public class ListNoticesServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ListNoticesServlet.class.getName());
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        logger.info("ListNoticesServlet: Processing GET request");
        
        List<Map<String, Object>> notices = new ArrayList<>();
        
        try (Connection con = DBConnection.getInstance().getConnection()) {
            if (con == null) {
                logger.severe("Database connection is null!");
                request.setAttribute("errorMessage", "Database connection failed!");
                request.getRequestDispatcher("notices.jsp").forward(request, response);
                return;
            }

            String sql = "SELECT id, title, message FROM notices ORDER BY id DESC";
            logger.info("Executing SQL query: " + sql);
            
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Map<String, Object> notice = new HashMap<>();
                        notice.put("id", rs.getInt("id"));
                        notice.put("title", rs.getString("title"));
                        notice.put("message", rs.getString("message"));
                        notices.add(notice);
                        logger.info("Retrieved notice - ID: " + notice.get("id") + ", Title: " + notice.get("title"));
                    }
                }
            }
            
            logger.info("Total notices retrieved: " + notices.size());
            request.setAttribute("notices", notices);
            request.getRequestDispatcher("notices.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error in ListNoticesServlet: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "Error retrieving notices: " + e.getMessage());
            request.getRequestDispatcher("notices.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}