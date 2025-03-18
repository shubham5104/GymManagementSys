<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gymmanagement.entity.Users" %>
<%@ page import="com.gymmanagement.entity.Plan" %>
<%
    List<Users> members = (List<Users>) request.getAttribute("members");
	List<Plan> plans = (List<Plan>) request.getAttribute("plans");
%>
<html>
<head>
    <title>Manage Members</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-4">Manage Members</h2>
    
    <div class="card mt-4">
        <div class="card-body">
            <h4 class="card-title">Add New Member</h4>
            <form action="addMember" method="post" class="row g-3">
                <div class="col-md-6">
                    <input type="text" name="name" class="form-control" placeholder="Name" required>
                </div>
                <div class="col-md-6">
                    <input type="email" name="email" class="form-control" placeholder="Email" required>
                </div>
                <div class="col-md-6">
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                </div>
                <div class="col-md-6">
                    <input type="text" name="phone" class="form-control" placeholder="Phone" required>
                </div>

                <!-- Dropdown for Selecting Plan with Price -->
                <div class="col-md-6">
                    <select name="plan" class="form-control" required>
                        <option value="" disabled selected>Select Your Plan</option>
                        <% if (plans != null && !plans.isEmpty()) { %>
                            <% for (Plan plan : plans) { %>
                                <option value="<%= plan.getName() %>">
                                    <%= plan.getName() %> - ₹<%= plan.getPrice() %>
                                </option>
                            <% } %>
                        <% } else { %>
                            <option value="" disabled>No Plans Available</option>
                        <% } %>
                    </select>
                </div>

                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-success">Add Member</button>
                </div>
            </form>
        </div>
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>Name</th><th>Email</th><th>Phone</th><th>Plan</th><th>Status</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for (Users member : members) { %>
                <tr>
                    <td><%= member.getName() %></td>
                    <td><%= member.getEmail() %></td>
                    <td><%= member.getPhone() %></td>
                    <td><%= member.getPlan() %></td>
                    <td>
                        <% if (member.isActive()) { %>
                            <span class="text-success">Active</span>
                        <% } else { %>
                            <span class="text-danger">Blocked</span>
                        <% } %>
                    </td>
                    <td>
                        <form action="deleteMember" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= member.getId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                        <% if (member.isActive()) { %>
                            <form action="blockMember" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= member.getId() %>">
                                <button type="submit" class="btn btn-warning">Block</button>
                            </form>
                        <% } else { %>
                            <form action="activateMember" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= member.getId() %>">
                                <button type="submit" class="btn btn-primary">Unblock</button>
                            </form>
                        <% } %>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Back to Dashboard Button -->
    <div class="text-center mt-4">
        <a href="dashboard" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
