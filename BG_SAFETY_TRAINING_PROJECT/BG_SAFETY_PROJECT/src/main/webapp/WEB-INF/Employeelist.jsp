<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Employee" %>
<%
    // Session check for Admin only
  //  HttpSession  //session = request.getSession(false);
    if (session == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Employees list passed from servlet
    List<Employee> employees = (List<Employee>) request.getAttribute("employeeList");
%>
<html>
<head>
    <title>Employee List - Brothers Gas</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <img src="images/logo.png" alt="Brothers Gas Logo" class="logo">
    <h1>Employee Management</h1>
    <a href="admin-dashboard.jsp">⬅ Back to Dashboard</a> |
    <a href="logout">Logout</a>
</header>

<main>
    <h2>Employees</h2>
    <a href="employee-form.jsp">➕ Add New Employee</a>

    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (employees != null && !employees.isEmpty()) {
                for (Employee emp : employees) {
        %>
            <tr>
                <td><%= emp.getId() %></td>
                <td><%= emp.getName() %></td>
                <td><%= emp.getDepartment() %></td>
                <td><%= emp.getStatus() %></td>
                <td>
                    <a href="employee-form.jsp?id=<%= emp.getId() %>">✏ Edit</a> |
                    <a href="employee?action=delete&id=<%= emp.getId() %>"
                       onclick="return confirm('Are you sure you want to delete this employee?');">🗑 Delete</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5">No employees found.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</main>
</body>
</html>
