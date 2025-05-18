<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Video Browsing System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!--CSS file path-->
    <link rel="stylesheet" href="Home.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">  
</head>
<body>

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
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">Games</a></li>
                  <li><a class="dropdown-item" href="#">Entertainment</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Multiplayer</a></li>
                </ul>
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
                <div class="d-flex auth-buttons">
                    <button class="btn login-btn me-2">Login</button>
                    <button class="btn signup-btn">Sign Up</button>
                </div>
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
                        <img src="images/trending 1.png" alt="video thumbnail image">
                        <span class="video-duration">45.12</span>
                        <div class="play-hover"><i class="fas fa-play"></i></div>
                    </div>
                    <div class="video-info">
                        <div class="channel-logo">
                            <img src="images/channel logo 1.jpg" alt="Channel-logo">
                        </div>
                        <div class="video-details">
                            <h5 class="video-title">Call of Duty: Black Ops 6</h5>
                            <p class="channel-name">CODbuddy</p>
                            <div class="video-views">
                                <span>245K views</span>
                                <span>•</span>
                                <span>1 days ago</span>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                <div class="col-md-6 col-lg-3 mb-4">
                  <div class="video-card">
                      <div class="video-thumbnail">
                          <img src="images/trending 1.png" alt="video thumbnail image">
                          <span class="video-duration">45.12</span>
                          <div class="play-hover"><i class="fas fa-play"></i></div>
                      </div>
                      <div class="video-info">
                          <div class="channel-logo">
                              <img src="images/channel logo 1.jpg" alt="Channel-logo">
                          </div>
                          <div class="video-details">
                              <h5 class="video-title">Call of Duty: Black Ops 6</h5>
                              <p class="channel-name">CODbuddy</p>
                              <div class="video-views">
                                  <span>245K views</span>
                                  <span>•</span>
                                  <span>1 days ago</span>
                              </div>
                          </div>
                      </div>
                  </div>
                </div>

                  <div class="col-md-6 col-lg-3 mb-4">
                    <div class="video-card">
                        <div class="video-thumbnail">
                            <img src="images/trending 1.png" alt="video thumbnail image">
                            <span class="video-duration">45.12</span>
                            <div class="play-hover"><i class="fas fa-play"></i></div>
                        </div>
                        <div class="video-info">
                            <div class="channel-logo">
                                <img src="images/channel logo 1.jpg" alt="Channel-logo">
                            </div>
                            <div class="video-details">
                                <h5 class="video-title">Call of Duty: Black Ops 6</h5>
                                <p class="channel-name">CODbuddy</p>
                                <div class="video-views">
                                    <span>245K views</span>
                                    <span>•</span>
                                    <span>1 days ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>

                  <div class="col-md-6 col-lg-3 mb-4">
                      <div class="video-card">
                          <div class="video-thumbnail">
                              <img src="images/trending 1.png" alt="video thumbnail image">
                              <span class="video-duration">45.12</span>
                              <div class="play-hover"><i class="fas fa-play"></i></div>
                          </div>
                          <div class="video-info">
                              <div class="channel-logo">
                                  <img src="images/channel logo 1.jpg" alt="Channel-logo">
                              </div>
                              <div class="video-details">
                                  <h5 class="video-title">Call of Duty: Black Ops 6</h5>
                                  <p class="channel-name">CODbuddy</p>
                                  <div class="video-views">
                                      <span>245K views</span>
                                      <span>•</span>
                                      <span>1 days ago</span>
                                  </div>
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
                    <img src="images/popular 1.jpg" alt="Content Creator icon">
                  </div>
                  <h5>CODbuddy</h5>
                  <p>10.8M Subscribers</p>
                  <button class="btn subscribe-btn">Subscribe</button>
              </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="creator-card">
                <div class="creator-icon">
                  <img src="images/popular 1.jpg" alt="Content Creator icon">
                </div>
                <h5>CODbuddy</h5>
                <p>10.8M Subscribers</p>
                <button class="btn subscribe-btn">Subscribe</button>
            </div>
        </div>

          <div class="col-6 col-md-3 col-lg-2">
              <div class="creator-card">
                  <div class="creator-icon">
                    <img src="images/popular 1.jpg" alt="Content Creator icon">
                  </div>
                  <h5>CODbuddy</h5>
                  <p>10.8M Subscribers</p>
                  <button class="btn subscribe-btn">Subscribe</button>
              </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="creator-card">
                <div class="creator-icon">
                  <img src="images/popular 1.jpg" alt="Content Creator icon">
                </div>
                <h5>CODbuddy</h5>
                <p>10.8M Subscribers</p>
                <button class="btn subscribe-btn">Subscribe</button>
            </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="creator-card">
                <div class="creator-icon">
                  <img src="images/popular 1.jpg" alt="Content Creator icon">
                </div>
                <h5>CODbuddy</h5>
                <p>10.8M Subscribers</p>
                <button class="btn subscribe-btn">Subscribe</button>
            </div>
          </div>

          <div class="col-6 col-md-3 col-lg-2">
            <div class="creator-card">
                <div class="creator-icon">
                  <img src="images/popular 1.jpg" alt="Content Creator icon">
                </div>
                <h5>CODbuddy</h5>
                <p>10.8M Subscribers</p>
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