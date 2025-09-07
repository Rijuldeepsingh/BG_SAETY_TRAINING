<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Training"%>
<%
    List<Training> trainings = (List<Training>) request.getAttribute("trainings");
    String role = (String) session.getAttribute("role"); // "admin" or "user"
%>
<!DOCTYPE html>
<html>
<head>
<title>Training List</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h2>Training Programs</h2>

	<% if ("admin".equals(role)) { %>
	<a href="training-form.jsp">➕ Add Training</a>
	<br>
	<br>
	<% } %>

	<table border="1" cellpadding="10">
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Description</th>
			<% if ("admin".equals(role)) { %>
			<th>Actions</th>
			<% } %>
		</tr>

		<% if (trainings != null && !trainings.isEmpty()) {
               for (Training t : trainings) { %>
		<tr>
			<td><%= t.getId() %></td>
			<td><%= t.getTitle() %></td>
			<td><%= t.getDescription() %></td>
			<% if ("admin".equals(role)) { %>
			<td><a href="training?action=edit&id=<%= t.getId() %>">Edit</a>
				| <a href="training?action=delete&id=<%= t.getId() %>"
				onclick="return confirm('Delete this training?');">Delete</a></td>
			<% } %>
		</tr>
		<%   } 
           } else { %>
		<tr>
			<td colspan="4">No trainings found.</td>
		</tr>
		<% } %>
	</table>

	<br>
	<a href="dashboard.jsp">⬅ Back to Dashboard</a>
</body>
</html>
