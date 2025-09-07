<%@ page import="java.util.List"%>
<%@ page import="model.EmployeeTraining"%>
<%@ page import="dao.EmployeeTrainingDao"%>

<html>
<head>
<title>Employee Training List</title>
<style>
body {
	font-family: Arial;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

h2 {
	text-align: center;
}
</style>
</head>
<body>
	<h2>Employee Training Assignments</h2>

	<%
        EmployeeTrainingDao dao = new EmployeeTrainingDao();
        List<EmployeeTraining> list = dao.getAllAssignments();
    %>

	<table>
		<tr>
			<th>ID</th>
			<th>Employee ID</th>
			<th>Training ID</th>
			<th>Status</th>
		</tr>

		<%
            for(EmployeeTraining et : list) {
        %>
		<tr>
			<td><%= et.getId() %></td>
			<td><%= et.getEmployeeId() %></td>
			<td><%= et.getTrainingId() %></td>
			<td><%= et.getStatus() %></td>
		</tr>
		<%
            }
        %>
	</table>
</body>
</html>
