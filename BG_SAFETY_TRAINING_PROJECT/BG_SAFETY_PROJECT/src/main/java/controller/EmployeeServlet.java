package controller;

import dao.EmployeeDao;
import model.Employee;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {

    private EmployeeDao employeeDao = new EmployeeDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            request.getRequestDispatcher("EmployeeForm.jsp").forward(request, response);
        } else {
            List<Employee> employees = employeeDao.getAllEmployees();
            request.setAttribute("employees", employees);
            request.getRequestDispatcher("EmployeeList.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String employeeCode = request.getParameter("employeeCode");
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String status = "untrained"; // Set default status to untrained

        Employee emp = new Employee(0, employeeCode, name, department, status);
        employeeDao.addEmployee(emp);

        response.sendRedirect("admin");
    }
}
