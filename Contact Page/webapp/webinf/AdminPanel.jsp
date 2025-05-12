<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<link rel="stylesheet" href="assets/styles.css">
</head>
<body class="admin-body">

<h2 class="section-title">Admin Panel</h2>
<table border="1" class="admin-table">
    <tr>
        <th>ID</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Phone</th><th>Message</th><th>Reply</th><th>Actions</th>
    </tr>
    <c:forEach var="msg" items="${messages}">
    <tr>
        <td>${msg.id}</td>
        <td>${msg.fname}</td>
        <td>${msg.lname}</td>
        <td>${msg.email}</td>
        <td>${msg.phone}</td>
        <td>${msg.msg}</td>
        <td>
            <form method="post" action="adminservlet" class="admin-form">
                <input type="hidden" name="action" value="updateReply"/>
                <input type="hidden" name="id" value="${msg.id}"/>
                <textarea name="reply" class="admin-textarea">${msg.reply}</textarea><br>
                <button type="submit" class="btn">Update</button>
            </form>
        </td>
        <td>
            <form action="adminservlet" method="post" style="display:inline;" class="admin-form">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="${msg.id}">
                <button type="submit" class="btn">Delete</button>
            </form>
			<br><br>
            <form action="adminservlet" method="post" style="display:inline;" class="admin-form">
                <input type="hidden" name="action" value="sendToFaq">
                <input type="hidden" name="id" value="${msg.id}">
                <button type="submit" class="btn">Send to FAQ</button>
            </form>
        </td>
    </tr>
    </c:forEach>
</table>

<hr class="divider">

<h2 class="section-title">FAQ Section</h2>
<table border="1" class="admin-table">
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Message</th>
        <th>Reply</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="faq" items="${faqs}">
        <tr>
            <td>${faq.id}</td>
            <td>${faq.fname}</td>
            <td>${faq.msg}</td>
            <td>${faq.reply}</td>
            <td>
                <form action="adminservlet" method="post" style="display:inline;" class="admin-form">
                    <input type="hidden" name="action" value="removeFromFaq">
                    <input type="hidden" name="id" value="${faq.id}">
                    <button type="submit" class="btn">Remove</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<form action="contactservlet" class="admin-form">
    <button type="submit" class="btn">Go to contact</button>
</form>

</body>
</html>
