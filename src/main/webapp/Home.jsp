<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="UserPackage.UserModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- Favicon -->
    <link rel="icon" type="image/png" sizes="32x32" href="https://cdn-icons-png.flaticon.com/512/3659/3659784.png">
    <link rel="icon" type="image/png" sizes="16x16" href="https://cdn-icons-png.flaticon.com/512/3659/3659784.png">
    <link rel="apple-touch-icon" href="https://cdn-icons-png.flaticon.com/512/3659/3659784.png">
    <title>Online Video Browsing System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!--CSS file path-->
    <link rel="stylesheet" href="css/home.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">  
</head>
<body>

    <%
    UserModel.User user = (UserModel.User)session.getAttribute("user");
    %>

    <!--NAVIGATION BAR-->
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <div class="container">
          <a class="navbar-brand fs-3 fw-bold d-flex align-items-center" href="#">
            <i class="fas fa-gamepad me-2"></i>
            <span>GameHUB</span>
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Trending</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Categories
                </a>
                <ul class="dropdown-menu bg-dark">
                  <li><a class="dropdown-item" href="#">Action Games</a></li>
                  <li><a class="dropdown-item" href="#">FPS Games</a></li>
                  <li><a class="dropdown-item" href="#">RPG Games</a></li>
                  <li><a class="dropdown-item" href="#">Strategy Games</a></li>
                  <li><a class="dropdown-item" href="#">Sports Games</a></li>
                  <li><a class="dropdown-item" href="#">Racing Games</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact Us</a>
              </li>
              <!--<li class="nav-item">
                <a class="nav-link" href="#">Live</a>
              </li>-->
              
            </ul>
                <form class="d-flex search-form me-3">
                    <div class="input-group">
                        <input class="form-control search-input" type="search" placeholder="Search videos..." aria-label="Search">
                        <button class="btn search-btn" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
                <% if (user != null) { %>
                    <div class="d-flex align-items-center">
                        <span class="welcome-text me-4">Welcome, <%= user.getFirstName() %></span>
                        <div class="dropdown">
                            <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="<%= user.getProfilePicture() != null ? user.getProfilePicture() : "uploads/profiles/default_avatar.png" %>" 
                                     alt="Profile Picture" 
                                     class="rounded-circle user-avatar"
                                     width="40" 
                                     height="40"
                                     style="object-fit: cover;">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end" aria-labelledby="userDropdown" style="background-color: #1a1a1a; border: 1px solid #333;">
                                <li>
                                    <a class="dropdown-item text-light" href="Profile.jsp">
                                        <i class="fas fa-user me-2"></i>Profile
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item text-light" href="#">
                                        <i class="fas fa-cog me-2"></i>Settings
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider" style="border-color: #333;"></li>
                                <li>
                                    <a class="dropdown-item text-light" href="LogoutServlet">
                                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                <% } else { %>
                    <div class="d-flex auth-buttons">
                        <a href="${pageContext.request.contextPath}/Login.jsp" class="btn login-btn me-2">Login</a>
                        <a href="${pageContext.request.contextPath}/Signup.jsp" class="btn signup-btn">Sign Up</a>
                    </div>
                <% } %>
          </div>
        </div>
      </nav>


      <!--SLIDER HERO SECTION-->
    <div class="hero-section">
      <div class="container">
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" >
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="slider-item" style="background-image: url('images/slider1.png')">
                <div class="slider-content">
                    <span class="badge slider-badge">TRENDING</span>
                    <h2>Call of Duty: Black Ops 6 - Ultimate Guide</h2>
                    <p>Watch the most comprehensive guide to mastering the campaign, multiplayer, and Zombies mode in Call of Duty: Black Ops 6</p>
                    <button class="btn slider-btn"><i class="fas fa-play me-2"></i>WATCH NOW</button>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="slider-item" style="background-image: url('images/slider2.png')">
                <div class="slider-content">
                    <span class="badge slider-badge">LIVE</span>
                    <h2>Elden Ring: Ultimate Boss Guide</h2>
                    <p>Watch the most comprehensive guide to defeating all bosses in Elden Ring</p>
                    <button class="btn slider-btn"><i class="fas fa-play me-2"></i>WATCH NOW</button>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="slider-item" style="background-image: url('images/slider3.png')">
                <div class="slider-content">
                    <span class="badge slider-badge">LIVE</span>
                    <h2>Elden Ring: Ultimate Boss Guide</h2>
                    <p>Watch the most comprehensive guide to defeating all bosses in Elden Ring</p>
                    <button class="btn slider-btn"><i class="fas fa-play me-2"></i>WATCH NOW</button>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="slider-item" style="background-image: url('images/slider4.png')">
                <div class="slider-content">
                    <span class="badge slider-badge">LIVE</span>
                    <h2>Elden Ring: Ultimate Boss Guide</h2>
                    <p>Watch the most comprehensive guide to defeating all bosses in Elden Ring</p>
                    <button class="btn slider-btn"><i class="fas fa-play me-2"></i>WATCH NOW</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <!--GAMING CATEGORIES SECTION GRID-->
    <div class="categories mt-5">
      <div class="container">
        <div class="section-header">
          <h3>Browse Categories</h3>
              <a href="#" class="view-all">View All <i class="fas fa-chevron-right"></i></a>
        </div>

        <div class="row">
          <div class="col-6 col-md-3 col-lg-2">
              <div class="categories-item">
                  <div class="categories-icon">
                    <i class="fas fa-gamepad"></i>
                  </div>
                  <h5>Action</h5>
              </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
              <div class="categories-item">
                  <div class="categories-icon">
                    <i class="fas fa-crosshairs"></i>
                  </div>
                  <h5>FPS</h5>
              </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
              <div class="categories-item">
                  <div class="categories-icon">
                    <i class="fas fa-car"></i>
                  </div>
                  <h5>Racing</h5>
              </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="categories-item">
                <div class="categories-icon">
                  <i class="fas fa-futbol"></i>
                </div>
                <h5>Sports</h5>
            </div>
        </div>

        <div class="col-6 col-md-3 col-lg-2">
          <div class="categories-item">
              <div class="categories-icon">
                <i class="fas fa-hat-wizard"></i>
              </div>
              <h5>RPG</h5>
          </div>
        </div>

        <div class="col-6 col-md-3 col-lg-2">
          <div class="categories-item">
              <div class="categories-icon">
                <i class="fas fa-chess"></i>
              </div>
              <h5>Strategy</h5>
          </div>
        </div>

        </div>
      </div>
    </div>

    <!--TRENDING VIDEOS-->
    <div class="trending-videos mt-5">
      <div class="container">
        <div class="section-header">
            <h3>Trending Now</h3>
            <a href="#" class="view-all">View All <i class="fas fa-chevron-right"></i></a>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="images/trending 1.png" alt="Call of Duty thumbnail">
                        <span class="video-duration">45:12</span>
                        <div class="play-hover"><i class="fas fa-play"></i></div>
                    </div>
                    <div class="video-info">
                        <div class="channel-logo">
                            <img src="images/channel logo 1.jpg" alt="CODbuddy channel">
                        </div>
                        <div class="video-details">
                            <h5 class="video-title">Call of Duty: Black Ops 6 - Ultimate Guide</h5>
                            <p class="channel-name">CODbuddy</p>
                            <div class="video-views">
                                <span>245K views</span>
                                <span>•</span>
                                <span>1 day ago</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-4">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="images/trending 2.png" alt="Elden Ring thumbnail">
                        <span class="video-duration">32:45</span>
                        <div class="play-hover"><i class="fas fa-play"></i></div>
                    </div>
                    <div class="video-info">
                        <div class="channel-logo">
                            <img src="images/channel logo 2.jpg" alt="SoulsMaster channel">
                        </div>
                        <div class="video-details">
                            <h5 class="video-title">Elden Ring: All Boss Strategies</h5>
                            <p class="channel-name">SoulsMaster</p>
                            <div class="video-views">
                                <span>189K views</span>
                                <span>•</span>
                                <span>2 days ago</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-4">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="images/trending 3.png" alt="FIFA 24 thumbnail">
                        <span class="video-duration">28:15</span>
                        <div class="play-hover"><i class="fas fa-play"></i></div>
                    </div>
                    <div class="video-info">
                        <div class="channel-logo">
                            <img src="images/channel logo 3.jpg" alt="ProGamer channel">
                        </div>
                        <div class="video-details">
                            <h5 class="video-title">FIFA 24: Pro Tips & Tricks</h5>
                            <p class="channel-name">ProGamer</p>
                            <div class="video-views">
                                <span>156K views</span>
                                <span>•</span>
                                <span>3 days ago</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 mb-4">
                <div class="video-card">
                    <div class="video-thumbnail">
                        <img src="images/trending 4.png" alt="GTA 6 thumbnail">
                        <span class="video-duration">15:30</span>
                        <div class="play-hover"><i class="fas fa-play"></i></div>
                    </div>
                    <div class="video-info">
                        <div class="channel-logo">
                            <img src="images/channel logo 4.jpg" alt="GameNews channel">
                        </div>
                        <div class="video-details">
                            <h5 class="video-title">GTA 6: Everything We Know</h5>
                            <p class="channel-name">GameNews</p>
                            <div class="video-views">
                                <span>320K views</span>
                                <span>•</span>
                                <span>5 hours ago</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--TOP (POPULAR) CREATORS SECTION-->
    <div class="popular-creators mt-5">
      <div class="container">
        <div class="section-header">
          <h3>Popular Creators</h3>
              <a href="#" class="view-all">View All <i class="fas fa-chevron-right"></i></a>
        </div>

        <div class="row">
          <div class="col-6 col-md-3 col-lg-2">
              <div class="creator-card">
                  <div class="creator-icon">
                    <img src="images/creator1.jpg" alt="CODbuddy">
                  </div>
                  <h5>CODbuddy</h5>
                  <p>10.8M Subscribers</p>
                  <button class="btn subscribe-btn">Subscribe</button>
              </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="creator-card">
                <div class="creator-icon">
                  <img src="images/creator2.jpg" alt="SoulsMaster">
                </div>
                <h5>SoulsMaster</h5>
                <p>8.5M Subscribers</p>
                <button class="btn subscribe-btn">Subscribe</button>
            </div>
        </div>

          <div class="col-6 col-md-3 col-lg-2">
              <div class="creator-card">
                  <div class="creator-icon">
                    <img src="images/creator3.jpg" alt="ProGamer">
                  </div>
                  <h5>ProGamer</h5>
                  <p>6.2M Subscribers</p>
                  <button class="btn subscribe-btn">Subscribe</button>
              </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="creator-card">
                <div class="creator-icon">
                  <img src="images/creator4.jpg" alt="GameNews">
                </div>
                <h5>GameNews</h5>
                <p>4.9M Subscribers</p>
                <button class="btn subscribe-btn">Subscribe</button>
            </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="creator-card">
                <div class="creator-icon">
                  <img src="images/creator5.jpg" alt="TechGaming">
                </div>
                <h5>TechGaming</h5>
                <p>3.7M Subscribers</p>
                <button class="btn subscribe-btn">Subscribe</button>
            </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="creator-card">
                <div class="creator-icon">
                  <img src="images/creator6.jpg" alt="RetroGamer">
                </div>
                <h5>RetroGamer</h5>
                <p>2.4M Subscribers</p>
                <button class="btn subscribe-btn">Subscribe</button>
            </div>
          </div>

        </div>
      </div>
    </div>

    <!--Recommended for You-->
   <div class="container">
   <div class="section-header">
          <h3>Recommended for You</h3>
              <a href="#" class="view-all">View All <i class="fas fa-chevron-right"></i></a>
        </div>
   <div class="row">
  <c:forEach var="videoFile" items="${videoFiles}">
    <div class="col-md-6 col-lg-3 mb-4">
      <div class="video-card">
        <div class="video-thumbnail">
          <video width="100%" height="auto" controls preload="metadata">
            <source src="${pageContext.request.contextPath}/videos/${videoFile}" type="video/mp4" />
            Your browser does not support the video tag.
          </video>
          <!--
          <span class="video-duration">--:--</span>
          <div class="play-hover"><i class="fas fa-play"></i></div> -->
        </div>
        
        
        <div class="video-info">
          <div class="channel-logo">
            <img src="images/channel logo 1.jpg" alt="Channel-logo" />
          </div>
          <div class="video-details">
            <h5 class="video-title">${videoFile}</h5>
            
            <!--  
            <p class="channel-name">CODbuddy</p>
            <div class="video-views">
              <span>0 views</span>
              <span>•</span>
              <span>Just now</span>
            </div>-->
            
          </div>
        </div>
        
      </div>
    </div>
  </c:forEach>
</div>
</div>


    <!--FOOTER SECTION-->
    <div class="footer mt-5">
      <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4 mb-md-0">
                <div class="footer-brand">
                    <i class="fas fa-gamepad me-2"></i>
                    <span>GameHUB</span>
                </div>
                <p class="footer-title">The ultimate platform for gaming and entertainment videos</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-discord"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="col-6 col-md-2 mb-3">
                <h5>Explore</h5>
                <ul class="footer-sublinks">
                    <li><a href="#">Trending</a></li>
                    <li><a href="#">Categories</a></li>
                    <li><a href="#">Live Streams</a></li>
                    <li><a href="#">Top Creators</a></li>
                </ul>
            </div>
            <div class="col-6 col-md-2 mb-3">
                <h5>Company</h5>
                <ul class="footer-sublinks">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Guide</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="col-6 col-md-2 mb-3">
                <h5>Support</h5>
                <ul class="footer-sublinks">
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Community</a></li>
                    <li><a href="#">Creator Arcade</a></li>
                    <li><a href="#">Report Center</a></li>
                </ul>
            </div>
            <div class="col-6 col-md-2 mb-3">
                <h5>Legal</h5>
                <ul class="footer-sublinks">
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Guidelines</a></li>
                    <li><a href="#">Licenses</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2025 GameHUB. All rights reserved.</p>
            <div class="language-selector">
                <i class="fas fa-globe"></i>
                <select>
                    <option>English</option>
                    <option>සිංහල</option>
                </select>
            </div>
        </div>
    </div>
    </div>



    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>