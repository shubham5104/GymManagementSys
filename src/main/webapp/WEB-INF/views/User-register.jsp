<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration - Gym Management</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
    background: url('https://cdn.prod.website-files.com/65496b1500aed8ad52a5a193/6705610423f0878ea8f4da84_Small%20private%20gym%20studio.webp') 
    no-repeat center center fixed;
    background-size: cover;
}

.register-container {
    max-width: 400px;
    margin: 100px auto;
    padding: 25px;
    background: rgba(0, 0, 0, 0.8); /* Increased contrast */
    color: white;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.6);
}

.register-container h2 {
    margin-bottom: 20px;
    text-align: center;
}

/* Style Input Fields */
.form-control {
    background: rgba(255, 255, 255, 0.15);
    color: white;
    border: 1px solid rgba(255, 255, 255, 0.2);
    padding: 12px;
    border-radius: 5px;
}

.form-control::placeholder {
    color: rgba(255, 255, 255, 0.7);
}

.form-control:focus {
    background: rgba(255, 255, 255, 0.3);
    color: white;
    border: 1px solid #ffcc00;
    box-shadow: 0 0 5px rgba(255, 204, 0, 0.6);
}

/* Dropdown Styling */
select.form-control {
    background: rgba(255, 255, 255, 0.9);
    color: black;
    border: 2px solid #ffcc00;
    padding: 10px;
    font-size: 16px;
    border-radius: 5px;
    appearance: none; /* Removes default arrow */
    cursor: pointer;
    transition: all 0.3s ease;
}

/* Add a custom dropdown arrow */
select.form-control:focus {
    border-color: #ff8800;
    box-shadow: 0 0 5px rgba(255, 136, 0, 0.6);
}

/* Style the dropdown options */
select.form-control option {
    background: white;
    color: black;
    font-size: 16px;
    padding: 10px;
}

/* Register Button */
.btn-custom {
    background-color: #ffcc00;
    color: black;
    font-weight: bold;
    padding: 12px;
    border: none;
    border-radius: 5px;
    transition: background 0.3s ease-in-out;
}

.btn-custom:hover {
    background-color: #e6b800;
}


.login-link {
    text-align: center;
    margin-top: 15px;
}

.login-link a {
    color: #ffcc00;
    font-weight: bold;
    text-decoration: none;
}

.login-link a:hover {
    text-decoration: underline;
}

</style>
</head>
<body>
	<div class="container">
		<div class="register-container">
			<h2>User Registration</h2>

			<% if (request.getAttribute("message") != null) { %>
			<p class="alert alert-danger text-center"><%= request.getAttribute("message") %></p>
			<% } %>

			<form action="register" method="post">
				<div class="mb-3">
					<label>Full Name:</label> <input type="text" name="name"
						class="form-control" required>
				</div>
				<div class="mb-3">
					<label>Email:</label> <input type="email" name="email"
						class="form-control" required>
				</div>
				<div class="mb-3">
					<label>Password:</label> <input type="password" name="password"
						class="form-control" required>
				</div>
				<div class="mb-3">
					<label>Phone Number:</label> <input type="text" name="phone"
						class="form-control" required>
				</div>
				<div class="mb-3">
					<label>Select Your Plan:</label> 
					<select name="plan" class="form-control" required>
						<option value="" disabled selected>Select Your Plan</option>
						<option value="Weight Loss">Weight Loss</option>
						<option value="Weight Gain">Weight Gain</option>
					</select>
				</div>
				<button type="submit" class="btn btn-custom w-100">Register</button>
			</form>

			<p class="login-link mt-3">
				Already a member? <a href="login">Login Here</a>
			</p>
		</div>
	</div>
</body>
</html>
