package controller;

import dao.EmployeeTrainingDao;
import model.EmployeeTraining;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/employee-training")
public class EmployeeTrainingServlet extends HttpServlet {

    private final EmployeeTrainingDao employeeTrainingDao = new EmployeeTrainingDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<EmployeeTraining> assignments = employeeTrainingDao.getAllAssignments();
        request.setAttribute("assignments", assignments);
        request.getRequestDispatcher("/employee-training-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NumberFormatException {

        try {
            int employeeId = Integer.parseInt(request.getParameter("employeeId"));
            int trainingId = Integer.parseInt(request.getParameter("trainingId"));
            String status = request.getParameter("status");

            // Optional: validate status matches expected ENUM
            if (!status.equals("Not Trained") && !status.equals("In Training") && !status.equals("Trained")) {
                throw new IllegalArgumentException("Invalid training status");
            }

            EmployeeTraining et = new EmployeeTraining(0, employeeId, trainingId, status);
            employeeTrainingDao.assignTraining(et);

            response.sendRedirect("employee-training");
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
        }
    }
}

