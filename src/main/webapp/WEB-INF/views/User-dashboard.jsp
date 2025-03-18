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
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #56ccf2, #2f80ed);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .dashboard-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 400px;
        }
        .dashboard-container h2 {
            color: #2f80ed;
        }
        .dashboard-container p {
            font-size: 16px;
            color: #333;
        }
        .logout-btn {
            width: 100%;
            background: #e74c3c;
            border: none;
            padding: 10px;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout-btn:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>

    <div class="dashboard-container">
        <h2>Welcome, <%= user.getName() %>!</h2>
        <hr>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Phone:</strong> <%= user.getPhone() %></p>
        <p><strong>Plan:</strong> <%= user.getPlan() %></p>
        <hr>
        <a href="logout">
            <button class="logout-btn">Logout</button>
        </a>
    </div>

</body>
</html>
