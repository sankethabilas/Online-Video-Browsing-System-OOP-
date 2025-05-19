package VideoBrowsing;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VideoViewServlet")
public class VideoViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("VideoViewServlet: doGet method started");
        
        // Get the deployment path
        String deploymentPath = getServletContext().getRealPath("/videos");
        System.out.println("Deployment path: " + deploymentPath);
        
        // Create videos directory if it doesn't exist
        File deploymentDir = new File(deploymentPath);
        if (!deploymentDir.exists()) {
            deploymentDir.mkdirs();
            System.out.println("Created videos directory at: " + deploymentPath);
        }
        
        // Get list of videos
        List<String> videoFiles = new ArrayList<>();
        File[] files = deploymentDir.listFiles();
        
        if (files != null) {
            System.out.println("Number of files found: " + files.length);
            for (File file : files) {
                String fileName = file.getName().toLowerCase();
                if (fileName.endsWith(".mp4") || fileName.endsWith(".webm") || fileName.endsWith(".mov")) {
                    videoFiles.add(file.getName());
                    System.out.println("Added video file: " + file.getName());
                    System.out.println("File size: " + file.length() + " bytes");
                    System.out.println("File path: " + file.getAbsolutePath());
                }
            }
        } else {
            System.out.println("No files found in directory");
        }
        
        System.out.println("Total video files found: " + videoFiles.size());
        
        // Set the video files as a request attribute
        request.setAttribute("videoFiles", videoFiles);
        System.out.println("Set videoFiles attribute in request");
        
        // Add context path to request for debugging
        request.setAttribute("contextPath", request.getContextPath());
        System.out.println("Context Path: " + request.getContextPath());
        
        String page = request.getParameter("page");

        if ("Home".equals(page)) {
            System.out.println("Forwarding to Home.jsp");
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } else {
            System.out.println("Forwarding to videoView.jsp");
            request.getRequestDispatcher("videoView.jsp").forward(request, response);
        }


    }
}