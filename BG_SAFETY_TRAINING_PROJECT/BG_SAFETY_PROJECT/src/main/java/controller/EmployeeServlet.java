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

        List<Employee> employees = employeeDao.getAllEmployees();
        request.setAttribute("employees", employees);
        request.getRequestDispatcher("employee-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String email = request.getParameter("email");
        String status = request.getParameter("status");

        Employee emp = new Employee(0, name, department, email, status);
        employeeDao.addEmployee(emp);

        response.sendRedirect("employee");
    }
}
