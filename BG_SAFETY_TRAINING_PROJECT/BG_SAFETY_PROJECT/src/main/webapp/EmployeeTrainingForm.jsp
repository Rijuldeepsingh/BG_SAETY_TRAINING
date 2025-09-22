<%@ page import="java.util.List"%>
<%@ page import="model.Employee"%>
<%@ page import="model.Training"%>
<%@ page import="dao.EmployeeDao"%>
<%@ page import="dao.TrainingDao"%>

<html>
<head>
<title>Assign Training</title>
<style>
body {
	font-family: Arial;
	background: #f9f9f9;
}

.container {
	width: 400px;
	margin: 50px auto;
	padding: 20px;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0px 0px 10px #ccc;
}

h2 {
	text-align: center;
}

label {
	display: block;
	margin: 10px 0 5px;
}

select, input[type="text"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 15px;
}

input[type="submit"] {
	width: 100%;
	padding: 10px;
	background: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background: #45a049;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Assign Training to Employee</h2>
		<form action="employee-training" method="post">
			<input type="hidden" name="action" value="add">

			<!-- Employee Dropdown -->
			<label for="employeeId">Employee:</label> <select name="employeeId"
				required>
				<%
                    EmployeeDao empDao = new EmployeeDao();
                    List<Employee> employees = empDao.getAllEmployees();
                    for(Employee e : employees) {
                %>
				<option value="<%= e.getId() %>"><%= e.getName() %></option>
				<%
                    }
                %>
			</select>

			<!-- Training Dropdown -->
			<label for="trainingId">Training:</label> <select name="trainingId"
				required>
				<%
                    TrainingDao tDao = new TrainingDao();
                    List<Training> trainings = tDao.getAllTrainings();
                    for(Training t : trainings) {
                %>
				<option value="<%= t.getId() %>"><%= t.getTitle() %></option>
				<%
                    }
                %>
			</select>

			<!-- Status Input -->
			<label for="status">Status:</label> <select name="status" required>
				<option value="untrained">Untrained</option>
				<option value="in_training">In Training</option>
				<option value="trained">Trained</option>
			</select> <input type="submit" value="Assign Training">
		</form>
	</div>
</body>
</html>
