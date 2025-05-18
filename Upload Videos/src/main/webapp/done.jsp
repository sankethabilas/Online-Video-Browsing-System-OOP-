<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success - Video Uploaded</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>GameHUB<span class="mainlogo">Success</span></h1>
        </header>
        
        <main>
            <div class="success-container">
                <h2>Upload Successful!</h2>
                <p class="success-message">Your video has been uploaded successfully.</p>
                
                <div class="action-buttons">
                    <a href="insert.jsp" class="btn-primary">Upload Another Video</a>
                    <a href="index.jsp" class="btn-secondary">Go to Home</a>
                </div>
            </div>
        </main>
    </div>
</body>
</html> 