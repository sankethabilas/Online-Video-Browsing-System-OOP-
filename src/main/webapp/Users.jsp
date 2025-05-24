<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserPackage.UserModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Management</title>
    <link rel="stylesheet" href="css/Admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%
UserModel.User user = (UserModel.User)session.getAttribute("user");
if (user == null || !"admin".equalsIgnoreCase(user.getUserType())) {
    response.sendRedirect("Login.jsp");
    return;
}
%>
<div class="container">
    <aside class="sidebar">
        <div class="sidebar-header">
            <h2>Video Admin</h2>
        </div>
        <nav>
            <ul>
                <li><a href="Admin.jsp"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="home.html"><i class="fas fa-video"></i> Videos</a></li>
                <li class="active"><a href="GetAllUsers"><i class="fas fa-users"></i> Users</a></li>
                <li><a href="#"><i class="fas fa-chart-bar"></i> Analytics</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
                <li><a href="notices.jsp"><i class="fas fa-sticky-note"></i> Notice</a></li>
                <li><a href="AdminContact.jsp"><i class="fas fa-question-circle"></i> FAQ</a></li>
            </ul>
        </nav>
        <div class="sidebar-footer">
            <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </aside>

    <div class="main-content">
        <header>
            <div class="search-container">
                <i class="fas fa-search"></i>
                <input type="text" id="userSearch" placeholder="Search users...">
            </div>
            <div class="user-profile">
                <span class="notification"><i class="fas fa-bell"></i></span>
                <div class="welcome-text">Welcome, <%= user.getFirstName() %></div>
                <a href="Profile.jsp" class="profile-image">
                    <img src="<%= user.getProfilePicture() != null ? user.getProfilePicture() : "uploads/profiles/default_avatar.png" %>" 
                         alt="Profile Picture" 
                         class="user-avatar">
                </a>
            </div>
        </header>

        <main>
            <div class="dashboard-header">
                <h1>Users Management</h1>
            </div>

            <div class="users-table-container">
                <table class="users-table">
                    <thead>
                        <tr>
                            <th>Profile</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>User Type</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        List<UserModel.User> users = (List<UserModel.User>)request.getAttribute("users");
                        if(users != null) {
                            for(UserModel.User u : users) {
                        %>
                        <tr>
                            <td>
                                <img src="<%= u.getProfilePicture() != null ? u.getProfilePicture() : "uploads/profiles/default_avatar.png" %>" 
                                     alt="Profile Picture" 
                                     class="user-avatar-small">
                            </td>
                            <td><%= u.getFirstName() %> <%= u.getLastName() %></td>
                            <td><%= u.getUsername() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><span class="user-type <%= u.getUserType().toLowerCase() %>"><%= u.getUserType() %></span></td>
                            <td>
                                <button class="action-btn edit" onclick="editUser('<%= u.getUserId() %>')">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="action-btn delete" onclick="deleteUser('<%= u.getUserId() %>')">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                        <% 
                            }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

<script>
function editUser(userId) {
    // TODO: Implement edit user functionality
    console.log('Edit user:', userId);
}

function deleteUser(userId) {
    if(confirm('Are you sure you want to delete this user?')) {
        // TODO: Implement delete user functionality
        console.log('Delete user:', userId);
    }
}

// Search functionality
document.getElementById('userSearch').addEventListener('input', function(e) {
    const searchText = e.target.value.toLowerCase();
    const rows = document.querySelectorAll('.users-table tbody tr');
    
    rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(searchText) ? '' : 'none';
    });
});
</script>
</body>
</html> 