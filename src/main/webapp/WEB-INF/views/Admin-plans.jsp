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
    <style>
       body {
            background: url('https://cdn.prod.website-files.com/65496b1500aed8ad52a5a193/6705610423f0878ea8f4da84_Small%20private%20gym%20studio.webp') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .form-control {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="mt-4 text-center">Manage Plans</h2>

    <!-- Add Plan Form -->
    <div class="card p-4 mt-3">
        <h4 class="card-title text-center">Add New Plan</h4>
        <form action="addPlan" method="post" class="row g-3">
            <div class="col-md-4">
                <input type="text" name="name" class="form-control" placeholder="Plan Name" required>
            </div>
            <div class="col-md-4">
                <input type="number" step="0.01" name="price" class="form-control" placeholder="Price" required>
            </div>
            <div class="col-md-4">
                <select name="duration" class="form-control" required>
                    <option value="Monthly">Monthly</option>
                    <option value="Quarterly">Quarterly</option>
                    <option value="Yearly">Yearly</option>
                </select>
            </div>
            <div class="col-12 text-center">
                <button type="submit" class="btn btn-success">Add Plan</button>
            </div>
        </form>
    </div>

    <!-- Plans Table -->
    <table class="table table-bordered table-striped mt-4">
        <thead class="table-dark">
            <tr>
                <th>Name</th><th>Price (₹)</th><th>Duration</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% if (plans != null && !plans.isEmpty()) { %>
                <% for (Plan plan : plans) { %>
                    <tr>
                        <td><%= plan.getName() %></td>
                        <td><%= plan.getPrice() %></td>
                        <td><%= plan.getDuration() %></td>
                        <td>
                            <form action="deletePlan" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= plan.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="4" class="text-center">No plans available.</td>
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
