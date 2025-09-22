package controller;

import dao.EmployeeDao;
import dao.EmployeeTrainingDao;
import dao.TrainingDao;
import model.Employee;
import model.EmployeeTraining;
import model.Training;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/assign-training")
public class AssignTrainingServlet extends HttpServlet {

    private final EmployeeDao employeeDao = new EmployeeDao();
    private final TrainingDao trainingDao = new TrainingDao();
    private final EmployeeTrainingDao employeeTrainingDao = new EmployeeTrainingDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employees = employeeDao.getAllEmployees();
        List<Training> trainings = trainingDao.getAllTrainings();

        request.setAttribute("employees", employees);
        request.setAttribute("trainings", trainings);

        request.getRequestDispatcher("AssignTraining.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainingIdStr = request.getParameter("trainingId");
        String[] employeeIdsStr = request.getParameterValues("employeeIds");

        if (trainingIdStr == null || trainingIdStr.isEmpty() || employeeIdsStr == null || employeeIdsStr.length == 0) {
            response.sendRedirect("assign-training?error=true");
            return;
        }

        int trainingId = Integer.parseInt(trainingIdStr);

        for (String employeeIdStr : employeeIdsStr) {
            int employeeId = Integer.parseInt(employeeIdStr);

            // Assign the training
            EmployeeTraining et = new EmployeeTraining(0, employeeId, trainingId, "in_training");
            employeeTrainingDao.assignTraining(et);

            // Update the employee's overall status in the employees table
            employeeDao.updateEmployeeStatus(employeeId, "in_training");
        }

        response.sendRedirect("admin");
    }
}
