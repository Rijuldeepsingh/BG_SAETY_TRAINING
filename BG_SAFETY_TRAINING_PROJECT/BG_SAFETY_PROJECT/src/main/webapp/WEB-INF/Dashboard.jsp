<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, model.User" %>
<%
    HttpSession session1 = request.getSession(false);
    User loggedUser = (User) session1.getAttribute("user");

    if (loggedUser == null) {
        response.sendRedirect("index.jsp"); // redirect to login if not logged in
        return;
    }

    String role = loggedUser.getRole(); // "admin" or "staff"
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <!-- Logout Button -->
    <form action="logout" method="post" class="logout">
        <button type="submit" class="btn btn-danger">Logout</button>
    </form>

    <h1>Welcome, <%= loggedUser.getUsername() %>!</h1>
    <h3>Role: <%= role %></h3>

    <!-- Employee Training Counts -->
    <div class="stats">
        <div class="stat-card stat--ok">
            <h3 class="stat-title">Trained Employees</h3>
            <p class="stat-value"><%= request.getAttribute("trainedCount") %></p>
        </div>

        <div class="stat-card stat--bad">
            <h3 class="stat-title">Untrained Employees</h3>
            <p class="stat-value"><%= request.getAttribute("untrainedCount") %></p>
        </div>

        <div class="stat-card stat--warn">
            <h3 class="stat-title">In Training</h3>
            <p class="stat-value"><%= request.getAttribute("inTrainingCount") %></p>
        </div>
    </div>

    <!-- Admin Section -->
    <% if ("admin".equalsIgnoreCase(role)) { %>
    <div class="admin-section">
        <h2>Admin Actions</h2>
        <form action="employee" method="post" class="form-card">
            <input type="hidden" name="action" value="add">
            <input type="text" name="name" placeholder="Employee Name" required>
            <input type="text" name="position" placeholder="Position" required>
            <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>

        <form action="employee" method="post" class="form-card">
            <input type="hidden" name="action" value="delete">
            <input type="number" name="employeeId" placeholder="Employee ID" required>
            <button type="submit" class="btn btn-danger">Delete Employee</button>
        </form>
    </div>
    <% } %>

    <!-- Staff Section -->
    <% if ("staff".equalsIgnoreCase(role)) { %>
    <div class="staff-section">
        <h2>Staff Actions</h2>
        <form action="employee-training" method="post" class="form-card">
            <input type="number" name="employeeId" placeholder="Employee ID" required>
            <input type="number" name="trainingId" placeholder="Training ID" required>
            <select name="status">
                <option value="in_training">In Training</option>
                <option value="completed">Completed</option>
            </select>
            <button type="submit" class="btn btn-primary">Assign / Update Training</button>
        </form>
    </div>
    <% } %>
</div>
</body>
</html>
