<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<h2>Admin Panel</h2>
<table border="1">
    <tr><th>ID</th><th>Message</th><th>Reply</th><th>Actions</th></tr>
    <c:forEach var="msg" items="${messages}">
    <tr>
        <td>${msg.id}</td>
        <td>${msg.fname}</td>
        <td>${msg.lname}</td>
        <td>${msg.email}</td>
        <td>${msg.phone}</td>
        <td>${msg.msg}</td>
        <td>
                <form method="post" action="adminservlet">
                    <input type="hidden" name="action" value="updateReply"/>
                    <input type="hidden" name="id" value="${msg.id}"/>
                    <textarea name="reply">${msg.reply}</textarea>
                    <button type="submit">Update</button>
                </form>
            </td>
        <td>
            <!-- Delete Button -->
            <form action="adminservlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="${msg.id}">
                <button type="submit">Delete</button>
            </form>

            <!-- Send to FAQ Button -->
            <form action="adminservlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="sendToFaq">
                <input type="hidden" name="id" value="${msg.id}">
                <button type="submit">Send to FAQ</button>
            </form>
        </td>
    </tr>
</c:forEach>
</table>

<hr>

<h2>FAQ Section</h2>
<table border="1">
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
                <!-- Remove from FAQ Button -->
                <form action="adminservlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="removeFromFaq">
                    <input type="hidden" name="id" value="${faq.id}">
                    <button type="submit">Remove</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<form action="contactservlet" >
        <button type="submit">Go to contact</button>
        </form>
</body>
</html>