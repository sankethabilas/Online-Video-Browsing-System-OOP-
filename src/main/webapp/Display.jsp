<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Video List - GameHUB</title>
    <!-- make links dynamic and flexible, name of webapp root directory -->
    <!--  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css">-->
    
    <style>
    
    header {
    	 text-align: center;
	}
    
    body {
	    background-color: #0f172a;
	    margin: 0;
	    padding: 40px;
	    font-family: sans-serif;
	    color: white;
	    
	}

	table {
	    width: 100%;
	    margin: auto;
	    border-collapse: collapse;
	    background-color: #1e293b;
	    border-radius: 12px;
	    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
	    overflow: hidden;
	}

	/* Table Header */
	th {
	    background-color: #e2e8f0;
	    color: #1e293b;
	    padding: 20px;
	    font-size: 1rem;
	    font-weight: bold;
	    border-bottom: 1px solid #cbd5e1;
	}

	/* Table Cells */
	td {
	    padding: 20px;
	    font-size: 0.95rem;
	    color: #f1f5f9;
	    border-bottom: 1px solid #334155;
	}

	tr:hover {
	    background-color: #334155;
	    color: white;
	}

	tr:hover td {
    	color: #fff;
	}

	.video-preview {
	    max-width: 200px;
	    border-radius: 8px;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	}

	.video-container {
	    width: 200px;
	    background: #000;
	    border-radius: 8px;
	    overflow: hidden;
	    margin-top: 10px;
	}

	video {
	    width: 100%;
	    height: auto;
	    display: block;
	    border-radius: 8px;
	}
	
	span {
	    font-size: 2.5rem;
	    font-weight: 700;
	    letter-spacing: 1px;
	    
	}
	
	p{
		font-size: 1rem;
	    font-weight: 500;
	    letter-spacing: 1px;
	    margin-bottom: 2rem;
	}
	
	.mainlogo {
	    color: #f97316;
	}
	
	.action-buttons{
		margin-top: 2rem;
	}
   
   	.btn-primary,
	.btn-secondary {
	    padding: 0.75rem 1.5rem;
	    border-radius: 6px;
	    font-weight: 600;
	    font-size: 1rem;
	    cursor: pointer;
	    transition: background-color 0.3s, transform 0.1s;
	    border: none;
	    font-family: inherit;
	    margin-right: 0;
	    text-decoration: none;
	}

	.btn-primary {
	    background-color: #7e22ce;
	    color: white;
	}

	.btn-primary:hover {
	    background-color: #9333ea;
	    transform: translateY(-2px);
	}

	.btn-secondary {
	    background-color: transparent;
	    color: white;
	    border: 1px solid #334155;
	}

	.btn-secondary:hover {
    	background-color: rgba(255, 255, 255, 0.05);
	}
   
   #searchInput {
    width: 300px;
    padding: 10px 15px;
    margin: 20px auto;
    display: block;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    background-color: #1e293b;
    color: #f1f5f9;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    outline: none;
	    transition: 0.3s ease;
	}
	
	#searchInput::placeholder {
	    color: #94a3b8;
	}
	
	#searchInput:focus {
	    background-color: #334155;
	    box-shadow: 0 0 0 2px #7e22ce;
	}
	
	.update, .delete {
	  background-color: #7e22ce;
	  color: white;
	  border: none;
	  padding: 8px 16px;
	  border-radius: 4px;
	  cursor: pointer;
	  font-size: 1rem;
	  margin-bottom: 0.5rem;
	}
	
	button:hover {
	  background-color: #9333ea;
	}
   
    .mature-warning {
        background-color: #ff4444;
        color: white;
        padding: 10px;
        margin-bottom: 12px;
        border-radius: 8px;
        border: 2px solid #ff0000;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }

    .mature-warning strong {
        display: block;
        font-size: 0.85em;
        margin-bottom: 5px;
    }

    .mature-warning p {
        margin: 0;
        font-size: 0.6em;
        opacity: 0.9;
    }
   
    </style>
    
    
</head>
<body>
    <div class="container">
        <header>
            <h1>GameHUB<span class="mainlogo">Videos</span></h1>
            <p>Manage your uploaded videos</p>
            
            <input type="text" id="searchInput" placeholder="search">
        </header>


	


        <main>
            <table id="table">
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
                <!-- JSTL (JavaServer Pages Standard Tag Library, for each video object, a row will be displayed -->
                <c:forEach var="video" items="${allDetails}">
                <tr>
                	<!-- Displays the video ID from the VBSModel -->
                    <td>${video.video_id}</td>
                    <td>
                        <div class="video-container">
                        	<!-- Shows a custom message if marked mature, show video preview, and load the correct path -->
                            ${video.warningDisplay}
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
                    	<!-- allows update.jsp to pre-fill the update form with current values -->
                    	<a href="update.jsp?video_id=${video.video_id}&title=${video.title}&description=${video.description}&category=${video.category}&tags=${video.tags}&mature=${video.mature}">
                    	<button class="update">Update</button>
                    	</a>
                    	
                    	<form action="DeleteServlet" method="post" style="display:inline;">
    						<input type="hidden" name="video_id" value="${video.video_id}" />
    						<button class="delete"  type="submit">Delete</button>
						</form>

                    </td>
                </tr>
                </c:forEach>
            </table>

            <div class="action-buttons">
                <a href="insert.jsp" class="btn-primary">Upload New Video</a>
                <a href="http://localhost:8090/Online_Video_Browsing_System/VideoViewServlet?page=Home
" class="btn-secondary">Back to Home</a>
            </div>
        </main>
    </div>
    
    
    <script>
    function filterTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase(); // case-insensitive
        table = document.getElementById("table");
        tr = table.getElementsByTagName("tr");

        // loop through all rows (except the header)
        for (i = 1; i < tr.length; i++) {
            tr[i].style.display = "none";

            td = tr[i].getElementsByTagName("td");
            for (var j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break; // stop checking other cells in the row
                    }
                }
            }
        }
    }
    
    document.getElementById("searchInput").addEventListener("input", filterTable);

    </script>
</body>
</html>