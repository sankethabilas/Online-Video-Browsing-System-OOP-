<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">
<title>Update video details</title>

<style>
	body {
    display: flex;
    justify-content: center;
    margin: 0;
    padding: 40px 0;
    background-color: #0f172a; 
          
	}

	form {
    width: 600px;
    background-color: #1e293b;
    padding: 40px;
    border-radius: 10px;
    color: white;
	}
	
	h1{
	padding-bottom: 40px;
	color:#f97316;
	font-family: sans-serif;
	text-align: center;
	}

</style>

</head>
<body>

	<%
		String video_id = request.getParameter("video_id");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String category = request.getParameter("category");
		String tags = request.getParameter("tags");
		String mature = request.getParameter("mature");
	%>
	
	 <form action="UpdateServlet" method="post" id="upload-video-form" enctype="multipart/form-data">
	 
	 	<h1>GAMEHUB Update</h1>
      
      	<!-- Video id-->
        <label class="label" for="video_id">Video id</label>
        <input type="text" id="video_id" name="video_id" readonly value="<%=video_id %>">
        <div class="error-message" id="titleError"></div>
        
        <div class="form-list">
		  <label for="videoFile">Upload Video</label>
		  <input type="file" id="videoFile" name="videoFile" accept="video/mp4,video/mov,video/webm" disabled>
		  <div class="error-message" id="videoError"></div>
		</div>

        <!-- Video Title-->
        <label class="label" for="title">Video Title</label>
        <input type="text" id="title" name="title" placeholder="Enter your video title" required value="<%=title %>">
        <div class="error-message" id="titleError"></div>
      
        <!-- Video Description -->
        <label class="label" for="description">Description</label>
       <textarea id="description" name="description" rows="4" placeholder="Describe your video" required><%=description %></textarea>
        <div class="error-message" id="descriptionError"></div>
      
        <!-- Video Category -->
        <label class="label" for="category">Video Category</label>
		<select id="category" name="category" required>
		  <option value="" disabled>Select category</option>
		  <option value="fps" <%= "fps".equals(category) ? "selected" : "" %>>FPS</option>
		  <option value="multiplayer" <%= "multiplayer".equals(category) ? "selected" : "" %>>Multiplayer</option>
		  <option value="rpg" <%= "rpg".equals(category) ? "selected" : "" %>>RPG</option>
		  <option value="strategy" <%= "strategy".equals(category) ? "selected" : "" %>>Strategy</option>
		  <option value="sports" <%= "sports".equals(category) ? "selected" : "" %>>Sports</option>
		  <option value="racing" <%= "racing".equals(category) ? "selected" : "" %>>Racing</option>
		  <option value="battle-royale" <%= "battle-royale".equals(category) ? "selected" : "" %>>Battle Royale</option>
		  <option value="openworld" <%= "openworld".equals(category) ? "selected" : "" %>>Open World</option>
		  <option value="adventure" <%= "adventure".equals(category) ? "selected" : "" %>>Adventure</option>
		  <option value="other" <%= "other".equals(category) ? "selected" : "" %>>Other</option>
		</select>

        <div class="error-message" id="categoryError"></div>
      
        <!-- Tags and keywords-->
        <label class="label" for="tags">Tags (comma separated (,))
        <input type="text" id="tags" name="tags" placeholder="e.g. gameplay, tutorial" value="<%=tags %>">
        </label>
        <div class="error-message" id="tagsError"></div>
      
        <!-- Mature Content -->
        <label class="label mature">
        <input type="checkbox" id="mature" name="mature" value="Y" <%= "Y".equals(mature) ? "checked" : "" %>>
        This video contains mature content (18+)
        </label>
        <div class="error-message" id="matureError"></div>
        
      
      
        <!-- Actions -->
        <button class="btn-primary" type="submit" id="submitBtn">Upload Video</button>
        <button class="btn-secondary" type="reset">Cancel</button>
      </form>
</body>
</html>