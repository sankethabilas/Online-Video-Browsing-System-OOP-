package VideoBrowsing;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateServlet")
@MultipartConfig
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the data from update form
		String video_id = request.getParameter("video_id");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String category = request.getParameter("category");
		String tags = request.getParameter("tags");
		
		String mature = request.getParameter("mature");
		if (mature != null) {
			mature = "Y";  // Checked
		} else {
			mature = "N";  // Not checked
		}
		
		//update data using controller
		boolean isTrue;
		isTrue = VBSController. updateData(video_id,title,description,category,tags,mature);
		
		if(isTrue == true) {
			List<VBSModel> videodetails = VBSController.getById(video_id);
			request.setAttribute("videodetails", videodetails);
			
			String alertMessage = "Data update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='GetAllServlet'</script>");
		}
		
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}
	


}
