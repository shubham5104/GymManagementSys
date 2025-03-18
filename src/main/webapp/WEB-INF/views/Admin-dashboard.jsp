<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gymmanagement.entity.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("loggedInAdmin");
    if (admin == null) {
        response.sendRedirect("login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center">
            <h2>Welcome, <%= admin.getName() %>!</h2>
            <a href="logout" class="btn btn-danger">Logout</a>
        </div>

        <hr>

        <div class="mt-3">
            <h4>Admin Panel</h4>
            <ul class="list-group"> 
                <li class="list-group-item"><a href="/admin/members">Manage Members</a></li>
                <li class="list-group-item"><a href="/admin/plans">Manage Plans</a></li>
                
            </ul>
        </div>
    </div>
</body>
</html>
