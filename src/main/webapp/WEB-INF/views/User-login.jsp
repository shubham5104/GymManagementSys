<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Gym Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #56ccf2, #2f80ed);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            width: 380px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .login-container h2 {
            color: #2f80ed;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .login-container input {
            border-radius: 5px;
        }
        .login-container .btn-primary {
            background: #2f80ed;
            border: none;
            transition: 0.3s;
        }
        .login-container .btn-primary:hover {
            background: #1c6fd4;
        }
        .login-container a {
            text-decoration: none;
            color: #2f80ed;
        }
        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Login</h2>

        <% if (request.getParameter("logout") != null) { %>
            <p class="alert alert-success">Logged out successfully!</p>
        <% } %>

        <% if (request.getAttribute("message") != null) { %>
            <p class="alert alert-danger"><%= request.getAttribute("message") %></p>
        <% } %>

        <form action="login" method="post">
            <div class="mb-3">
                <input type="email" name="email" class="form-control" placeholder="Enter Email" required>
            </div>
            <div class="mb-3">
                <input type="password" name="password" class="form-control" placeholder="Enter Password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>

        <p class="mt-3">
            <a href="register">Don't have an account? Register</a>
        </p>
    </div>

</body>
</html>
