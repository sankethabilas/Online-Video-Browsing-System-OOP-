package FAQPackage;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class adminservlet
 */
@WebServlet("/adminservlet")
public class adminservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Adminservices as = new Adminservices();
        List<contactmodel> messages = as.getAllMessages();//to fetch *all messages*
        List<contactmodel> faqs = as.getFaqMessages();//to fetch only the messages which are selected to the faq section

        request.setAttribute("messages", messages); //**Adds the list of *all messages** to the HTTP request object
        request.setAttribute("faqs", faqs); //*Adds the list of FAQ messages* to the HTTP request object

        RequestDispatcher rd = request.getRequestDispatcher("AdminContact.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Adminservices as = new Adminservices();
        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);

            switch (action) {
                case "updateReply":
                    String reply = request.getParameter("reply");
                    as.updateReply(id, reply);
                    break;

                case "sendToFaq":
                    as.markAsFaq(id);
                    break;

                case "delete":
                    as.deleteById(id);
                    break;

                case "removeFromFaq":
                    as.unmarkAsFaq(id);
                    break;
            }
        }

        response.sendRedirect("adminservlet");
    }


}