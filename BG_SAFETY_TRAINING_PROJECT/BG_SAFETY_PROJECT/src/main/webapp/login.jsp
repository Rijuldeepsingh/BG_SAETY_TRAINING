<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Brothers Gas | Safety Training Portal - Login</title>
<link rel="stylesheet" href="css/style.css">
<style>
body {
	font-family: Arial, sans-serif;
	background: white;
	margin: 0;
	padding: 0;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}

body::before {
	content: '';
	position: absolute;
	top: 50%;
	left: 0;
	right: 0;
	width: 100%;
	height: 20px;
	background: linear-gradient(90deg, #4CAF50 0%, #66BB6A 100%);
	z-index: 1;
	margin-top: -120px;
}

body::after {
	content: '';
	position: absolute;
	top: 50%;
	left: 0;
	right: 0;
	width: 100%;
	height: 20px;
	background: linear-gradient(90deg, #2196F3 0%, #42A5F5 100%);
	z-index: 1;
	margin-top: 120px;
}

.login-container {
	width: 450px;
	background: white;
	padding: 40px;
	border: 2px solid #333;
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
	text-align: center;
	position: relative;
	z-index: 2;
}

.logo-container {
	margin-bottom: 30px;
}

.logo-container img {
	width: 120px;
	height: auto;
	margin-bottom: 10px;
}

.company-name {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin: 0;
	letter-spacing: 1px;
}

.tagline {
	font-size: 12px;
	color: #666;
	margin: 5px 0 0 0;
	text-transform: uppercase;
	letter-spacing: 2px;
}

.error {
	color: #d32f2f;
	background: #ffebee;
	padding: 12px;
	border-radius: 6px;
	margin-bottom: 25px;
	border-left: 4px solid #d32f2f;
	text-align: left;
}

.form-group {
	margin-bottom: 25px;
	text-align: left;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: #333;
	font-size: 14px;
	text-transform: uppercase;
	letter-spacing: 1px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 15px;
	border: 2px solid #e0e0e0;
	border-radius: 8px;
	font-size: 16px;
	box-sizing: border-box;
	background-color: #f8f9fa;
	transition: border-color 0.3s, background-color 0.3s;
}

input[type="text"]:focus, input[type="password"]:focus {
	outline: none;
	border-color: #2196F3;
	background-color: white;
}

.submit-btn {
	width: 100%;
	padding: 15px;
	background: linear-gradient(45deg, #4CAF50, #66BB6A);
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 1px;
	cursor: pointer;
	transition: transform 0.2s, box-shadow 0.2s;
	margin-top: 10px;
}

.submit-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(76, 175, 80, 0.3);
}

.submit-btn:active {
	transform: translateY(0);
}
</style>
</head>
<body>
	<div class="login-container">
		<div class="logo-container">
			<img src="images/logo.png" alt="Brothers Gas Logo">
			<div class="company-name">BROTHERS GAS</div>
			<div class="tagline">NATURE'S CLEANEST ENERGY</div>
		</div>

		<!-- Show error message if login fails -->
		<%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
		<div class="error">
			<strong>Login Failed:</strong>
			<%= error %>
		</div>
		<%
            }
        %>

		<form action="login" method="post">
			<div class="form-group">
				<label for="username">USERNAME</label>
				<input type="text" id="username" name="username" required
					value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
			</div>

			<div class="form-group">
				<label for="password">PASSWORD</label>
				<input type="password" id="password" name="password" required>
			</div>

			<button type="submit" class="submit-btn">SUBMIT</button>
		</form>
	</div>
</body>
</html>