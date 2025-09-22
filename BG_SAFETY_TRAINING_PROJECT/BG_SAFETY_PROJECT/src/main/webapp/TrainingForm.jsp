<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Training</title>
    <link rel="stylesheet" href="css/list-styles.css">
    <style>
        .form-container {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .action-btn {
            background: #2196F3;
            color: #79f526;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s;
            text-transform: uppercase;
        }
        .action-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(33, 150, 243, 0.2);
        }
    </style>
</head>
<body>
    <%-- Header --%>
    <div class="dashboard-header">
        <div class="user-info">
            <span class="username"><%= ((User)session.getAttribute("user")).getUsername().toUpperCase() %></span>
            <div class="nav-buttons">
                <a href="admin" class="nav-btn">BACK</a>
            </div>
        </div>
        <div class="user-actions">
            <form action="logout" method="post" style="display: inline;">
                <button type="submit" class="logout-btn" title="Logout">⏻</button>
            </form>
            <div class="logo-container">
                <img src="images/logo.png" alt="Brothers Gas Logo">
            </div>
        </div>
    </div>

    <%-- Main Content --%>
    <div class="content-container">
        <h2 class="page-title">ADD NEW TRAINING</h2>
        <div class="form-container">
            <form action="training" method="post">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="4" required></textarea>
                </div>
                <button type="submit" class="action-btn">Add Training</button>
            </form>
        </div>
    </div>
</body>
</html>
