package controller;

import dao.EmployeeTrainingDao;
import model.EmployeeTrainingDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/training-list")
public class TrainingListServlet extends HttpServlet {

    private final EmployeeTrainingDao employeeTrainingDao = new EmployeeTrainingDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = request.getParameter("status");
        String pageTitle = "";

        if (status == null || status.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Status parameter is missing.");
            return;
        }

        List<EmployeeTrainingDetails> employeeList = employeeTrainingDao.getEmployeeTrainingDetailsByStatus(status);

        switch (status) {
            case "trained":
                pageTitle = "Trained Employee List";
                break;
            case "in_training":
                pageTitle = "In-Training Employee List";
                break;
            default:
                pageTitle = "Employee List";
                break;
        }

        request.setAttribute("employeeList", employeeList);
        request.setAttribute("pageTitle", pageTitle);

        request.getRequestDispatcher("TrainingEmployeeList.jsp").forward(request, response);
    }
}
