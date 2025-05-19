<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video List - GameHUB</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/display.css">

</head>
<body>
	<div class="container">
		<header>
			<h1>
				GameHUB<span class="mainlogo">Videos</span>
			</h1>
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
									<source
										src="${pageContext.request.contextPath}/${video.videoFile}"
										type="video/mp4">
									<source
										src="${pageContext.request.contextPath}/${video.videoFile}"
										type="video/webm">
									<source
										src="${pageContext.request.contextPath}/${video.videoFile}"
										type="video/mov">
									Your browser does not support the video tag.
								</video>
							</div>
						</td>
						<td>${video.title}</td>
						<td>${video.description}</td>
						<td>${video.category}</td>
						<td>${video.tags}</td>
						<td>${video.mature}</td>


						<td><a
							href="update.jsp?video_id=${video.video_id}&title=${video.title}&description=${video.description}&category=${video.category}&tags=${video.tags}&mature=${video.mature}">
								<button>Update</button>
						</a></td>
					</tr>
				</c:forEach>
			</table>

			<div class="action-buttons">
				<a href="insert.jsp" class="btn-primary">Upload New Video</a> <a
					href="http://localhost:8090/VideoBrowsingSystem2/VideoViewServlet?page=Home
"
					class="btn-secondary">Back to Home</a>
			</div>
		</main>
	</div>
</body>
</html>