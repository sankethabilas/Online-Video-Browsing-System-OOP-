package VideoBrowsing;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String video_id = request.getParameter("video_id");
		boolean isTrue;
		isTrue = VBSController.deletedata(video_id);
		
		
		if(isTrue == true) {
			String alertMessage = "Data delete Successful";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='GetAllServlet';</script>");
	}
	
	else {
		List <VBSModel> videoDetails = VBSController.getById(video_id);
		request.setAttribute("videoDetails", videoDetails);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
		dispatcher.forward(request, response);
	}
	}
}