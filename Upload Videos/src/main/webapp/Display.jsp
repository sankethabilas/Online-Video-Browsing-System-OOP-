<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Video List - GameHUB</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 30px 0;
            background-color: black;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }
        
        th, td {
            padding: 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f4f4f4;
            font-weight: bold;
             color: black;
        }
        
        td {
           color: white;
        }
        
        tr:hover {
            background-color: #f5f5f5;
            color: black;
        }
        
        .video-preview {
            max-width: 200px;
            border-radius: 4px;
        }
        
        /* Add styles for video container */
        .video-container {
            width: 200px;
            background: #000;
            border-radius: 4px;
            overflow: hidden;
        }
        
        video {
            width: 100%;
            height: auto;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>GameHUB<span class="mainlogo">Videos</span></h1>
            <p>Manage your uploaded videos</p>
        </header>

        <main>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Video</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Tags</th>
                    <th>Mature</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="video" items="${allDetails}">
                <tr>
                    <td>${video.video_id}</td>
                    <td>
                        <div class="video-container">
                            <video class="video-preview" controls preload="metadata">
                                <source src="${pageContext.request.contextPath}/${video.videoFile}" type="video/mp4">
                                <source src="${pageContext.request.contextPath}/${video.videoFile}" type="video/webm">
                                <source src="${pageContext.request.contextPath}/${video.videoFile}" type="video/mov">
                                Your browser does not support the video tag.
                            </video>
                        </div>
                    </td>
                    <td>${video.title}</td>
                    <td>${video.description}</td>
                    <td>${video.category}</td>
                    <td>${video.tags}</td>
                    <td>${video.mature}</td>
                    
                    
                    <td>
                    	<a href="update.jsp?video_id=${video.video_id}&title=${video.title}&description=${video.description}&category=${video.category}&tags=${video.tags}&mature=${video.mature}">
                    	<button>Update</button>
                    	</a>
                    </td>
                </tr>
                </c:forEach>
            </table>

            <div class="action-buttons">
                <a href="insert.jsp" class="btn-primary">Upload New Video</a>
                <a href="index.jsp" class="btn-secondary">Back to Home</a>
            </div>
        </main>
    </div>
</body>
</html>