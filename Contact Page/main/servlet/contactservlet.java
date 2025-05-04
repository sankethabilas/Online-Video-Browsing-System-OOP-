package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.contactmodel;
import services.contactservices;
import services.Adminservices;

@WebServlet("/contactservlet")
public class contactservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public contactservlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Adminservices ads = new Adminservices();
		List<contactmodel> faqs = ads.getFaqMessages();

		request.setAttribute("faqs", faqs);
		RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		contactmodel cm = new contactmodel();
		cm.setFname(request.getParameter("fname"));
		cm.setLname(request.getParameter("lname"));
		cm.setEmail(request.getParameter("email"));
		cm.setPhone(Integer.parseInt(request.getParameter("phone")));
		cm.setMsg(request.getParameter("msg"));

		contactservices cs = new contactservices();
		cs.insertdetails(cm);

		// Load FAQs after submitting form
		Adminservices ads = new Adminservices();
		List<contactmodel> faqsmsgs = ads.getFaqMessages();
		request.setAttribute("faqs", faqsmsgs);//*Adds the list of FAQ messages* to the HTTP request object under the name "faqs".This makes the data available to the JSP page, which can then loop through and display the FAQ entries.

		RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
		rd.forward(request, response);
	}
}
