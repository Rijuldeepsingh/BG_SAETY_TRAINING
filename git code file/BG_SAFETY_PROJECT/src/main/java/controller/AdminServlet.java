package controller;

import dao.AdminDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private AdminDao adminDao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int trained = adminDao.getTrainedCount();
        int untrained = adminDao.getUntrainedCount();
        int inTraining = adminDao.getInTrainingCount();

        request.setAttribute("trainedCount", trained);
        request.setAttribute("untrainedCount", untrained);
        request.setAttribute("inTrainingCount", inTraining);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}

