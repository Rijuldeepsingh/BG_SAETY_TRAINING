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
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { max-width: 800px; margin: auto; }
        h1 { color: #0073e6; }
        .counts { display: flex; justify-content: space-around; margin: 20px 0; }
        .box {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            width: 30%;
        }
        .admin-section, .staff-section { margin-top: 30px; }
        .logout { float: right; }
        button { padding: 8px 15px; margin-top: 10px; }
    </style>
</head>
<body>
<div class="container">
    <form action="logout" method="post" class="logout">
        <button type="submit">Logout</button>
    </form>

    <h1>Welcome, <%= loggedUser.getUsername() %>!</h1>
    <h3>Role: <%= role %></h3>

    <!-- Employee Training Counts -->
    <div class="counts">
        <div class="box">
            <h2>Trained</h2>
            <p><%= request.getAttribute("trainedCount") %></p>
        </div>
        <div class="box">
            <h2>Untrained</h2>
            <p><%= request.getAttribute("untrainedCount") %></p>
        </div>
        <div class="box">
            <h2>In Training</h2>
            <p><%= request.getAttribute("inTrainingCount") %></p>
        </div>
    </div>

    <!-- Admin Section -->
    <%
        if ("admin".equalsIgnoreCase(role)) {
    %>
    <div class="admin-section">
        <h2>Admin Actions</h2>
        <form action="employee" method="post">
            <input type="hidden" name="action" value="add">
            <input type="text" name="name" placeholder="Employee Name" required>
            <input type="text" name="position" placeholder="Position" required>
            <button type="submit">Add Employee</button>
        </form>

        <form action="employee" method="post">
            <input type="hidden" name="action" value="delete">
            <input type="number" name="employeeId" placeholder="Employee ID" required>
            <button type="submit">Delete Employee</button>
        </form>
    </div>
    <% } %>

    <!-- Staff Section -->
    <%
        if ("staff".equalsIgnoreCase(role)) {
    %>
    <div class="staff-section">
        <h2>Staff Actions</h2>
        <form action="employee-training" method="post">
            <input type="number" name="employeeId" placeholder="Employee ID" required>
            <input type="number" name="trainingId" placeholder="Training ID" required>
            <select name="status">
                <option value="in_training">In Training</option>
                <option value="completed">Completed</option>
            </select>
            <button type="submit">Assign / Update Training</button>
        </form>
    </div>
    <% } %>

</div>
</body>
</html>
