<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - Video Upload Failed</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>GameHUB<span class="mainlogo">Error</span></h1>
        </header>
        
        <main>
            <div class="error-container">
                <h2>Upload Failed</h2>
                <% 
                String error = (String) request.getAttribute("error");
                if(error != null && !error.trim().isEmpty()) {
                %>
                    <p class="error-message">Error: <%= error %></p>
                <% } else { %>
                    <p class="error-message">An unexpected error occurred while uploading your video.</p>
                <% } %>
                
                <div class="action-buttons">
                    <a href="insert.jsp" class="btn-primary">Try Again</a>
                    <a href="index.jsp" class="btn-secondary">Go to Home</a>
                </div>
            </div>
        </main>
    </div>
</body>
</html> 