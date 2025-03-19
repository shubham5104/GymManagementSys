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
    <style>
        body {
            background: url('https://cdn.prod.website-files.com/65496b1500aed8ad52a5a193/6705610423f0878ea8f4da84_Small%20private%20gym%20studio.webp') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }
        .dashboard-container {
            max-width: 800px;
            margin: auto;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .btn-custom {
            background-color: #ffcc00;
            color: black;
            font-weight: bold;
        }
        .btn-custom:hover {
            background-color: #e6b800;
        }
        .list-group-item {
            background: transparent;
            border: 1px solid white;
            color: white;
        }
        .list-group-item a {
            text-decoration: none;
            color: white;
        }
        .list-group-item:hover {
            background: rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="dashboard-container text-center">
            <h2>Welcome, <%= admin.getName() %>!</h2>
            <a href="logout" class="btn btn-danger mt-2">Logout</a>

            <hr>

            <h4>Admin Panel</h4>
            <ul class="list-group mt-3"> 
                <li class="list-group-item"><a href="/admin/members">Manage Members</a></li>
                <li class="list-group-item"><a href="/admin/plans">Manage Plans</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
