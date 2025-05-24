package AdminPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteNoticeServlet")
public class DeleteNoticeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(DeleteNoticeServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idToDelete = request.getParameter("id");
        logger.info("Received delete request for notice ID: " + idToDelete);

        if (idToDelete == null || idToDelete.isEmpty()) {
            logger.warning("Missing ID parameter in delete request");
            response.sendRedirect("notices.jsp?message=missing_id");
            return;
        }

        try {
            int id = Integer.parseInt(idToDelete);
            try (Connection con = DBConnection.getInstance().getConnection()) {
                if (con == null) {
                    logger.severe("Database connection is null!");
                    response.sendRedirect("notices.jsp?message=db_error");
                    return;
                }

                PreparedStatement ps = con.prepareStatement("DELETE FROM notices WHERE id = ?");
                ps.setInt(1, id);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    logger.info("Notice deleted successfully. ID: " + id);
                    response.sendRedirect("notices.jsp?message=delete_success");
                } else {
                    logger.warning("No notice found with ID: " + id);
                    response.sendRedirect("notices.jsp?message=not_found");
                }
                ps.close();
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid ID format: " + idToDelete, e);
            response.sendRedirect("notices.jsp?message=invalid_id");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during notice deletion", e);
            response.sendRedirect("notices.jsp?message=system_error");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}