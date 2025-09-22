<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="model.Employee"%>
<%
    // If editing, we expect an Employee object in request scope
    Employee emp = (Employee) request.getAttribute("employee");
    boolean isEdit = (emp != null);
%>
<!DOCTYPE html>
<html>
<head>
<title><%= isEdit ? "Edit Employee" : "Add Employee" %></title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h2><%= isEdit ? "Edit Employee" : "Add New Employee" %></h2>

	<form action="employee" method="post">
		<% if (isEdit) { %>
		<!-- Hidden ID when editing -->
		<input type="hidden" name="id" value="<%= emp.getId() %>">
		<% } %>

		<label for="name">Name:</label> <input type="text" id="name"
			name="name" value="<%= isEdit ? emp.getName() : "" %>" required><br>
		<br> <label for="department">Department:</label> <input
			type="text" id="department" name="department"
			value="<%= isEdit ? emp.getDepartment() : "" %>" required><br>
		<br>

		<button type="submit"><%= isEdit ? "Update Employee" : "Add Employee" %></button>
		<a href="employee">Cancel</a>
	</form>
</body>
</html>
