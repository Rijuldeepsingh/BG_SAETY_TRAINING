<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Employee" %>
<%@ page import="model.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Untrained Employees</title>
    <link rel="stylesheet" href="css/list-styles.css">
</head>
<body>
    <%
        HttpSession session1 = request.getSession(false);
        User loggedUser = (User) session1.getAttribute("user");
        String role = (loggedUser != null) ? loggedUser.getRole() : "";
    %>

    <!-- Header -->
    <div class="dashboard-header">
        <div class="user-info">
            <span class="username"><%= (loggedUser != null) ? loggedUser.getUsername().toUpperCase() : "GUEST" %></span>
            <div class="nav-buttons">
                <a href="admin" class="nav-btn">BACK</a>
            </div>
        </div>
        <div class="user-actions">
            <form action="logout" method="post" style="display: inline;">
                <button type="submit" class="logout-btn" title="Logout">⏻</button>
            </form>
            <button class="notification-btn">🔔</button>
            <div class="logo-container">
                <img src="images/logo.png" alt="Brothers Gas Logo">
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content-container">
        <h2 class="page-title">LIST OF UNTRAINED EMPLOYEES</h2>
        <table>
            <thead>
                <tr>
                    <th>EMPLOYEE ID</th>
                    <th>NAME</th>
                    <th>TRAINING</th>
                    <th>DATE</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
                    if (employeeList != null && !employeeList.isEmpty()) {
                        for (Employee item : employeeList) {
                %>
                <tr>
                    <td><%= item.getId() %></td>
                    <td><%= item.getName() %></td>
                    <td>N/A</td>
                    <td>N/A</td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4">No untrained employees found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
