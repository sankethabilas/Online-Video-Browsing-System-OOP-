package AdminPackage;

import java.io.IOException;
import java.util.logging.Logger;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminUpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(UpdateServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String title = request.getParameter("title");
        String message = request.getParameter("message");

        logger.info("Received update request - ID: " + idParam + ", Title: " + title + ", Message: " + message);

        if (idParam == null || idParam.isEmpty()) {
            logger.warning("Missing ID parameter in update request");
            response.sendRedirect("ListNotices?message=missing_id");
            return;
        }

        if (title == null || title.isEmpty() || message == null || message.isEmpty()) {
            logger.warning("Missing title or message in update request");
            response.sendRedirect("ListNotices?message=missing_data");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            logger.info("Attempting to update notice with ID: " + id);
            
            boolean isSuccess = noticesControl.updatedata(id, title, message);

            if (isSuccess) {
                logger.info("Notice update successful");
                response.sendRedirect("ListNotices?message=update_success");
            } else {
                logger.warning("Notice update failed - no rows affected");
                response.sendRedirect("ListNotices?message=update_error");
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid ID format: " + idParam, e);
            response.sendRedirect("ListNotices?message=invalid_id");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Unexpected error during notice update", e);
            response.sendRedirect("ListNotices?message=system_error");
        }
    }
}