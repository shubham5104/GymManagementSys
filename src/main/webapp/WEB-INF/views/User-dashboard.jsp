<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gymmanagement.entity.Users" %>

<%
    Users user = (Users) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard - Gym Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://cdn.prod.website-files.com/65496b1500aed8ad52a5a193/6705610423f0878ea8f4da84_Small%20private%20gym%20studio.webp') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        .dashboard-container {
            max-width: 450px;
            margin: 100px auto;
            padding: 30px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }
        .dashboard-container h2 {
            text-align: center;
            color: #ffcc00;
            margin-bottom: 20px;
        }
        .dashboard-container p {
            font-size: 16px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            padding-bottom: 5px;
            margin-bottom: 10px;
        }
        .status-active {
            color: #28a745;
            font-weight: bold;
        }
        .status-inactive {
            color: #dc3545;
            font-weight: bold;
        }
        .btn-custom {
            background-color: #ffcc00;
            color: black;
            font-weight: bold;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #e6b800;
        }
        .navbar {
            background: rgba(0, 0, 0, 0.8);
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Gym Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div class="container">
        <div class="dashboard-container">
            <h2>Welcome, <%= user.getName() %>!</h2>
            <p><strong>ID:</strong> <%= user.getId() %></p>
            <p><strong>Email:</strong> <%= user.getEmail() %></p>
            <p><strong>Phone:</strong> <%= user.getPhone() %></p>
            <p><strong>Plan:</strong> <%= user.getPlan() %></p>
            <p><strong>Status:</strong> 
                <span class="<%= user.isActive() ? "status-active" : "status-inactive" %>">
                    <%= user.isActive() ? "Active" : "Inactive" %>
                </span>
            </p>
            <a href="logout" class="btn btn-custom mt-3">Logout</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
