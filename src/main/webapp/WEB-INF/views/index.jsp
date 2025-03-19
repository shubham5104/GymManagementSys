<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gym Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://cdn.prod.website-files.com/65496b1500aed8ad52a5a193/6705610423f0878ea8f4da84_Small%20private%20gym%20studio.webp') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            width: 450px;
            text-align: center;
        }
        h1 {
            color: #ffcc00;
            margin-bottom: 20px;
        }
        .switch-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }
        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        input:checked + .slider {
            background-color: #ffcc00;
        }
        input:checked + .slider:before {
            transform: translateX(26px);
        }
        .panel {
            display: none;
            animation: fadeIn 0.5s ease-in-out;
        }
        .btn-custom {
            width: 100%;
            background-color: #ffcc00;
            color: black;
            font-weight: bold;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background-color: #e6b800;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Gym Management System</h1>
        <p>Manage your gym efficiently with our system.</p>

        <!-- Switch Toggle -->
        <div class="switch-container">
            <span>User</span>
            <label class="switch">
                <input type="checkbox" id="toggleSwitch">
                <span class="slider"></span>
            </label>
            <span>Admin</span>
        </div>

        <!-- Admin Panel -->
        <div id="adminPanel" class="panel">
            <h3>Admin Panel</h3>
            <a href="/admin/login" class="btn btn-custom">Admin Login</a>
            <a href="/admin/register" class="btn btn-custom">Admin Register</a>
        </div>

        <!-- User Panel -->
        <div id="userPanel" class="panel">
            <h3>User Panel</h3>
            <a href="/user/login" class="btn btn-custom">User Login</a>
            <a href="/user/register" class="btn btn-custom">User Register</a>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const toggleSwitch = document.getElementById("toggleSwitch");
            const adminPanel = document.getElementById("adminPanel");
            const userPanel = document.getElementById("userPanel");

            function updateView() {
                if (toggleSwitch.checked) {
                    adminPanel.style.display = "block";
                    userPanel.style.display = "none";
                } else {
                    userPanel.style.display = "block";
                    adminPanel.style.display = "none";
                }
            }

            toggleSwitch.addEventListener("change", updateView);
            updateView(); // Initial state
        });
    </script>
</body>
</html>
