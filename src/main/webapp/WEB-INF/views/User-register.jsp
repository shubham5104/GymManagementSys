<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gym Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .message {
            color: red;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        input[type="submit"] {
            background: #ff7e5f;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }
        input[type="submit"]:hover {
            background: #e76b51;
        }
        .login-link {
            margin-top: 15px;
            font-size: 14px;
        }
        .login-link a {
            color: #ff7e5f;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register for Gym Membership</h2>
        
        <% if (request.getAttribute("message") != null) { %>
            <p class="message"><%= request.getAttribute("message") %></p>
        <% } %>

        <form action="register" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="phone" placeholder="Phone Number" required>
            
            <select name="plan" required>
                <option value="" disabled selected>Select Your Plan</option>
                <option value="Weight Loss">Weight Loss</option>
                <option value="Weight Gain">Weight Gain</option>
            </select>
            
            <input type="submit" value="Register">
        </form>
        
        <p class="login-link">Already a member? <a href="login">Login Here</a></p>
    </div>
</body>
</html>
