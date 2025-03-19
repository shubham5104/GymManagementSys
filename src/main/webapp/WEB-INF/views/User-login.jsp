<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login - Gym Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://cdn.prod.website-files.com/65496b1500aed8ad52a5a193/6705610423f0878ea8f4da84_Small%20private%20gym%20studio.webp') no-repeat center center fixed;
            background-size: cover;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 25px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }
        .login-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-control {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.3);
            color: white;
        }
        .btn-custom {
            background-color: #ffcc00;
            color: black;
            font-weight: bold;
        }
        .btn-custom:hover {
            background-color: #e6b800;
        }
        .register-link {
            text-align: center;
            margin-top: 10px;
        }
        .register-link a {
            color: #ffcc00;
            font-weight: bold;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <h2>User Login</h2>

            <% if (request.getParameter("logout") != null) { %>
                <p class="alert alert-success text-center">Logged out successfully!</p>
            <% } %>

            <% if (request.getAttribute("message") != null) { %>
                <p class="alert alert-danger text-center"><%= request.getAttribute("message") %></p>
            <% } %>

            <form action="login" method="post">
                <div class="mb-3">
                    <label>Email:</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Password:</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-custom w-100">Login</button>
            </form>

            <!-- Registration Link -->
            <p class="register-link mt-3">
                Don't have an account? <a href="register">Register Here</a>
            </p>
        </div>
    </div>
</body>
</html>
