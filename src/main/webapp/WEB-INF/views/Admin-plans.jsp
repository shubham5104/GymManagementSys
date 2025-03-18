<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gymmanagement.entity.Plan" %>
<%
    List<Plan> plans = (List<Plan>) request.getAttribute("plans");
%>
<html>
<head>
    <title>Manage Plans</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-4">Manage Plans</h2>
    
    <form action="addPlan" method="post" class="mb-3">
        <input type="text" name="name" placeholder="Plan Name" required>
        <input type="number" step="0.01" name="price" placeholder="Price" required>
        <select name="duration" required>
            <option value="Monthly">Monthly</option>
            <option value="Quarterly">Quarterly</option>
            <option value="Yearly">Yearly</option>
        </select>
        <button type="submit" class="btn btn-success">Add Plan</button>
    </form>

    <table class="table">
        <thead>
            <tr>
                <th>Name</th><th>Price</th><th>Duration</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for (Plan plan : plans) { %>
                <tr>
                    <td><%= plan.getName() %></td>
                    <td><%= plan.getPrice() %></td>
                    <td><%= plan.getDuration() %></td>
                    <td>
                        <form action="deletePlan" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= plan.getId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
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
