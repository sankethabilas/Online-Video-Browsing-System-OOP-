<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GameHUB - Video Gallery</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">
    <style>
        .video-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            padding: 2rem;
        }
        
        .video-card {
            background-color: var(--card-bg);
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid var(--border-color);
        }
        
        .video-container {
            position: relative;
            width: 100%;
            padding-top: 56.25%; /* 16:9 Aspect Ratio */
        }
        
        .video-container video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .video-info {
            padding: 1rem;
        }
        
        .video-title {
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
            color: var(--text-primary);
        }
        
        .empty-message {
            text-align: center;
            padding: 2rem;
            color: var(--text-secondary);
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>GameHUB<span class="mainlogo">Videos</span></h1>
            <p>Browse all uploaded gaming videos</p>
        </header>

        <main>
            <div class="video-grid">
                <c:choose>
                    <c:when test="${empty videoFiles}">
                        <div class="empty-message">
                            <h2>No videos found</h2>
                            <p>Upload some videos to get started!</p>
                            <a href="insert.jsp" class="btn-primary">Upload Video</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="videoFile" items="${videoFiles}">
                            <div class="video-card">
                                <div class="video-container">
                                    <video controls preload="metadata">
                                        <source src="${pageContext.request.contextPath}/videos/${videoFile}" type="video/mp4">
                                        <source src="${pageContext.request.contextPath}/videos/${videoFile}" type="video/webm">
                                        <source src="${pageContext.request.contextPath}/videos/${videoFile}" type="video/mov">
                                        Your browser does not support the video tag.
                                    </video>
                                </div>
                                <div class="video-info">
                                    <h3 class="video-title">${videoFile}</h3>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div style="text-align: center; margin-top: 2rem;">
                <a href="insert.jsp" class="btn-primary">Upload New Video</a>
                <a href="index.jsp" class="btn-secondary">Back to Home</a>
            </div>
        </main>
    </div>
</body>
</html>