<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="javax.servlet.http.*, model.User"%>
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
<title>Dashboard - Brothers Gas Safety Training</title>
<link rel="stylesheet" href="css/style.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	min-height: 100vh;
	margin: 0;
	padding: 0;
}

.dashboard-container {
	width: 100%;
	padding: 0;
}

/* Header Section */
.dashboard-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: white;
	padding: 15px 30px;
	margin-bottom: 0;
	box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	width: 100%;
}

.user-info {
	display: flex;
	align-items: center;
	gap: 15px;
}

.username {
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.nav-buttons {
	display: flex;
	gap: 10px;
}

.nav-btn {
	padding: 8px 16px;
	border: none;
	border-radius: 20px;
	font-weight: bold;
	font-size: 12px;
	text-transform: uppercase;
	cursor: pointer;
	transition: all 0.3s;
}

.nav-btn.trained {
	background: #2196F3;
	color: #79f526;
	font-weight: bold;
	font-size: 16px;
}

.nav-btn.untrained {
	background: #2196F3;
	color: #79f526;
	font-weight: bold;
	font-size: 16px;
}

.nav-btn.training {
	background: #2196F3;
	color: #79f526;
	font-weight: bold;
	font-size: 16px;
}

.nav-btn.assign {
	background: #2196F3;
	color: #79f526;
	font-weight: bold;
	font-size: 16px;
}

.user-actions {
	display: flex;
	align-items: center;
	gap: 15px;
}

.notification-btn {
	background: #4CAF50;
	border: none;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

.chat-btn {
	background: #4CAF50;
	border: none;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

.logo-container {
	display: flex;
	align-items: center;
	gap: 10px;
}

.logo-container img {
	width: 80px;
	height: auto;
}

/* Logout Button */
.logout-btn {
	background: #79f526;
	color: white;
	border: none;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	font-size: 18px;
	cursor: pointer;
	margin-right: 15px;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* Main Content Layout */
.dashboard-content {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 20px;
	margin: 20px;
	margin-bottom: 30px;
}

.left-section {
	background: white;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.section-title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-bottom: 20px;
}

.stats-container {
	display: flex;
	gap: 15px;
	margin-bottom: 30px;
}

.stat-item {
	flex: 1;
	text-align: center;
}

.stat-button {
	width: 100%;
	padding: 8px 16px;
	border: none;
	border-radius: 20px;
	font-weight: bold;
	font-size: 12px;
	text-transform: uppercase;
	margin-bottom: 10px;
}

.stat-button.trained {
	background: #2196F3;
	color: #79f526;
	font-weight: bold;
	font-size: 16px;
}

.stat-button.untrained {
	background: #2196F3;
	color: #79f526;
	font-weight: bold;
	font-size: 16px;
}

.stat-button.training {
	background: #2196F3;
	color: #79f526;
	font-weight: bold;
	font-size: 16px;
}

.stat-number {
	background: #f0f0f0;
	padding: 30px 20px;
	border-radius: 8px;
	font-size: 48px;
	font-weight: bold;
	color: #333;
}

/* Right Section */
.right-section {
	background: white;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	border: 2px solid #2196F3;
}

.admin-actions h3 {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin-bottom: 20px;
	text-align: center;
	text-decoration: underline;
}

.action-item {
	margin-bottom: 30px;
	text-align: center;
}

.action-title {
	font-size: 16px;
	font-weight: bold;
	color: #333;
	margin-bottom: 15px;
	text-decoration: underline;
}

.action-btn {
	background: #2196F3;
	color: #79f526;
	border: none;
	padding: 8px 16px;
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

/* Responsive */
@media (max-width: 768px) {
	.dashboard-content {
		grid-template-columns: 1fr;
	}
	
	.stats-container {
		flex-direction: column;
	}
	
	.dashboard-header {
		flex-direction: column;
		gap: 15px;
	}
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<!-- Header -->
		<div class="dashboard-header">
			<div class="user-info">
				<span class="username">
					<%= (loggedUser != null) ? loggedUser.getUsername().toUpperCase() : "GUEST" %>
				</span>
				<div class="nav-buttons">
					<a href="training-list?status=trained" class="nav-btn trained">TRAINED</a>
					<a href="untrained-list" class="nav-btn untrained">UNTRAINED</a>
					<a href="training-list?status=in_training" class="nav-btn training">TRAINING</a>
					<% if ("admin".equalsIgnoreCase(role)) { %>
					<a href="assign-training" class="nav-btn assign">ASSIGN</a>
					<% } %>
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
		<div class="dashboard-content">
			<!-- Left Section -->
			<div class="left-section">
				<h2 class="section-title">TOTAL COUNT OF EMPLOYEES</h2>
				
				<div class="stats-container">
				        <div class="stat-item">
				            <button class="stat-button trained">TRAINED</button>
				            <div class="stat-number"><%= request.getAttribute("trainedCount") != null ? request.getAttribute("trainedCount") : "0" %></div>
				        </div>
				        
				        <div class="stat-item">
				            <button class="stat-button untrained">UNTRAINED</button>
				            <div class="stat-number"><%= request.getAttribute("untrainedCount") != null ? request.getAttribute("untrainedCount") : "0" %></div>
				        </div>
				        
				        <div class="stat-item">
				            <button class="stat-button training">TRAINING</button>
				            <div class="stat-number"><%= request.getAttribute("inTrainingCount") != null ? request.getAttribute("inTrainingCount") : "0" %></div>
				        </div>
				    </div>			</div>

			<!-- Right Section - Admin Only -->
			<% if ("admin".equalsIgnoreCase(role)) { %>
			<div class="right-section">
				<div class="admin-actions">
					<h3>Admin Panel</h3>
					
					<div class="action-item">
						<div class="action-title">ADD NEW TRAINING</div>
						<form action="training" method="get" style="display: inline;">
							<input type="hidden" name="action" value="add">
							<button type="submit" class="action-btn">ADD</button>
						</form>
					</div>
					
					<div class="action-item">
						<div class="action-title">ADD NEW EMPLOYEE</div>
						<form action="employee" method="get" style="display: inline;">
							<input type="hidden" name="action" value="add">
							<button type="submit" class="action-btn">ADD</button>
						</form>
					</div>
				</div>
			</div>
			<% } %>
			
			<!-- Right Section - User (Empty for staff) -->
			<% if ("staff".equalsIgnoreCase(role)) { %>
			<div class="right-section">
				<!-- Empty section for staff users as shown in design -->
			</div>
			<% } %>
		</div>
	</div>
</body>
</html>
