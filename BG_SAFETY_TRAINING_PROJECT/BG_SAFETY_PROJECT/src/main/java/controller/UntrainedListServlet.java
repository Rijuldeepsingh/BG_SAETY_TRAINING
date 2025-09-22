package controller;

import dao.EmployeeDao;
import model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/untrained-list")
public class UntrainedListServlet extends HttpServlet {

    private final EmployeeDao employeeDao = new EmployeeDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Employee> employeeList = employeeDao.getEmployeesByStatus("untrained");

        request.setAttribute("employeeList", employeeList);
        request.setAttribute("pageTitle", "Untrained Employee List");

        request.getRequestDispatcher("UntrainedEmployeeList.jsp").forward(request, response);
    }
}
