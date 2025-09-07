<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Diagnostic Page</title>
</head>
<body>
	<h1>Tomcat and Application Diagnostics</h1>
	<p>If you can see this page, it means that your project is deployed
		correctly and the context path is correct. The problem is likely with
		your servlets or their configuration.</p>

	<h2>System Properties:</h2>
	<ul>
		<li>Java Version: <%= System.getProperty("java.version") %></li>
		<li>Servlet Container: <%= application.getServerInfo() %></li>
		<li>Context Path: <%= request.getContextPath() %></li>
		<li>Real Path of this JSP: <%= application.getRealPath(request.getServletPath()) %></li>
	</ul>
</body>
</html>
