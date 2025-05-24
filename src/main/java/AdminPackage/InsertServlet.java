package AdminPackage;

import java.io.IOException;
import java.util.logging.Logger;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminInsertServlet")
public class InsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(InsertServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String message = request.getParameter("message");

        logger.info("Received insert request - Title: " + title + ", Message: " + message);

        if (title == null || title.trim().isEmpty() || message == null || message.trim().isEmpty()) {
            logger.warning("Missing title or message in insert request");
            response.sendRedirect("ListNotices?message=missing_data");
            return;
        }

        try {
            boolean isSuccess = noticesControl.insertData(title.trim(), message.trim());

            if (isSuccess) {
                logger.info("Notice inserted successfully");
                response.sendRedirect("ListNotices?message=success");
            } else {
                logger.warning("Failed to insert notice");
                response.sendRedirect("ListNotices?message=error");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during notice insertion", e);
            response.sendRedirect("ListNotices?message=system_error");
        }
    }
}