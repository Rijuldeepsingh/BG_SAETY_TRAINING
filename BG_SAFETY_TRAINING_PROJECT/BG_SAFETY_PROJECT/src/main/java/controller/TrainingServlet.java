package controller;

import dao.TrainingDao;
import model.Training;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/training")
public class TrainingServlet extends HttpServlet {

    private TrainingDao trainingDao = new TrainingDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            request.getRequestDispatcher("TrainingForm.jsp").forward(request, response);
        } else {
            List<Training> trainings = trainingDao.getAllTrainings();
            request.setAttribute("trainings", trainings);
            request.getRequestDispatcher("TrainingList.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Training training = new Training(0, title, description);
        trainingDao.addTraining(training);

        response.sendRedirect("admin");
    }
}
