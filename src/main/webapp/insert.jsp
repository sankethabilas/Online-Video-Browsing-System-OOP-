<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- make links dynamic and flexible, name of webapp root directory -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">
	<meta charset="UTF-8">
	<title>GameVids - Upload Your Gaming Videos</title>
    <link rel="stylesheet" href="testing.css">
</head>
<body>
<div class="container">
  <header>
      <h1>GameHUB<span class="mainlogo">Upload</span></h1>
      <p>Unleash your greatest gaming highlights</p>
  </header>

  <main>
  	<!-- multipart tells browser to send video files properly -->
    <form action="InsertServlet" method="post" id="upload-video-form" enctype="multipart/form-data">
      
        <div class="form-list">
		  <label for="videoFile">Upload Video</label>
		  <input type="file" id="videoFile" name="videoFile" accept="video/mp4,video/mov,video/webm" required>
		  <div class="error-message" id="videoError"></div>
		</div>


        <!-- Video Title-->
        <label class="label" for="title">Video Title</label>
        <input type="text" id="title" name="title" placeholder="Enter your video title" required>
        <div class="error-message" id="titleError"></div>
      
        <!-- Video Description -->
        <label class="label" for="description">Description</label>
        <textarea id="description" name="description" rows="4" placeholder="Describe your video" required></textarea>
        <div class="error-message" id="descriptionError"></div>
      
        <!-- Video Category -->
        <label class="label" for="category">Video Category</label>
        <select id="category" name="category" required>
          <option value="" disabled selected>Select category</option>
          <option value="fps">FPS</option>
          <option value="multiplayer">multiplayer</option>
          <option value="rpg">RPG</option>
          <option value="strategy">Strategy</option>
          <option value="sports">Sports</option>
          <option value="racing">Racing</option>
          <option value="battle-royale">Battle Royale</option>
          <option value="openworld">Open World</option>
          <option value="adventure">Adventure</option>
          <option value="other">Other</option>
        </select>
        <div class="error-message" id="categoryError"></div>
      
        <!-- Tags and keywords-->
        <label class="label" for="tags">Tags (comma separated (,))
        <input type="text" id="tags" name="tags" placeholder="e.g. gameplay, tutorial">
        </label>
        <div class="error-message" id="tagsError"></div>
      
        <!-- Mature Content -->
        <label class="label mature">
          <input type="checkbox" id="mature" name="mature">
          This video contains mature content (18+)
        </label>
        <div class="error-message" id="matureError"></div>
        
      
        <!-- Terms and conditions-->
        <label class="label">
          <input type="checkbox" id="terms" name="terms" required>
          I agree to the <a href="#">Terms of Service</a> and <a href="#">Community Guidelines</a>
        </label>
        <div class="error-message" id="termsError"></div>
      
        <!-- Actions -->
        <button class="btn-primary" type="submit" id="submitBtn">Upload Video</button>
        <button class="btn-secondary" type="reset">Cancel</button>
      </form>
    </main>
    
  </div>
 <script src="uploadValidation.js"></script>
</body>

</html>