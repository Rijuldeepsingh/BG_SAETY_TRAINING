<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Employee" %>
<%@ page import="model.Training" %>
<%@ page import="model.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assign Training</title>
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
        .form-group select, .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .employee-table {
            width: 100%;
            border-collapse: collapse;
        }
        .employee-table th, .employee-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .employee-table th {
            background-color: #f2f2f2;
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
        .dropdown-check-list {
            display: inline-block;
            position: relative;
            width: 100%;
        }

        .dropdown-check-list .anchor {
            position: relative;
            cursor: pointer;
            display: inline-block;
            padding: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #fff;
        }

        .dropdown-check-list .anchor:after {
            position: absolute;
            content: "";
            border-left: 2px solid black;
            border-top: 2px solid black;
            padding: 5px;
            right: 15px;
            top: 25%;
            -moz-transform: rotate(-135deg);
            -ms-transform: rotate(-135deg);
            -o-transform: rotate(-135deg);
            -webkit-transform: rotate(-135deg);
            transform: rotate(-135deg);
        }

        .dropdown-check-list .anchor:active:after {
            right: 8px;
            top: 21%;
        }

        .dropdown-check-list ul.items {
            padding: 2px;
            display: none;
            margin: 0;
            border: 1px solid #ccc;
            border-top: none;
            position: absolute;
            width: 100%;
            background: #fff;
            z-index: 1;
        }

        .dropdown-check-list ul.items li {
            list-style: none;
            padding: 5px 10px;
        }

        .dropdown-check-list.visible .anchor {
            color: #0094ff;
        }

        .dropdown-check-list.visible .items {
            display: block;
        }
    </style>
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
        <h2 class="page-title">ASSIGN TRAINING TO EMPLOYEES</h2>
        <div class="form-container">
            <form action="assign-training" method="post">
                <div class="form-group">
                    <label for="trainingId">Select Training</label>
                    <select id="trainingId" name="trainingId" required>
                        <option value="">-- Select Training --</option>
                        <%
                            List<Training> trainings = (List<Training>) request.getAttribute("trainings");
                            if (trainings != null) {
                                for (Training training : trainings) {
                        %>
                        <option value="<%= training.getId() %>"><%= training.getTitle() %></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label>Select Employees</label>
                    <div class="dropdown-check-list" tabindex="100">
                        <span class="anchor">Select Employees</span>
                        <ul class="items">
                            <li><input type="checkbox" id="selectAll" /> Select All</li>
                            <%
                                List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                                if (employees != null) {
                                    for (Employee employee : employees) {
                            %>
                            <li><input type="checkbox" name="employeeIds" value="<%= employee.getId() %>" /><%= employee.getName() %> - <%= employee.getDepartment() %></li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>

                <button type="submit" class="action-btn">Assign Training</button>
            </form>
        </div>
    </div>

    <script>
        var checkList = document.querySelector('.dropdown-check-list');
        checkList.getElementsByClassName('anchor')[0].onclick = function (evt) {
            if (checkList.classList.contains('visible'))
                checkList.classList.remove('visible');
            else
                checkList.classList.add('visible');
        }

        document.getElementById('selectAll').addEventListener('click', function(event) {
            var checkboxes = document.getElementsByName('employeeIds');
            for (var checkbox of checkboxes) {
                checkbox.checked = event.target.checked;
            }
        });
    </script>
</body>
</html>