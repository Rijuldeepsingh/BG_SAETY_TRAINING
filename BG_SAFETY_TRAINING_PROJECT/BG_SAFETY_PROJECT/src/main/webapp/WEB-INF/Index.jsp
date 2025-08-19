<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Brothers Gas | Safety Training Portal</title>
    <link rel="stylesheet" href="css/style.css"> <!-- optional -->
</head>
<body>
    <div class="login-container">
        <h2>Safety Training Portal</h2>

        <!-- Show error message if login fails -->
        <%
            String error = (String) request.getAttribute("errorMessage");
            if (error != null) {
        %>
            <p style="color:red;"><%= error %></p>
        <%
            }
        %>

        <form action="login" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required><br><br>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required><br><br>

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
