package hcmuaf.nlu.edu.vn.controller.admin.log;

import hcmuaf.nlu.edu.vn.util.logUtil.LogUtilDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-Log")
public class DeleteLogController extends HttpServlet {
    private LogUtilDao logUtilDao ;

    public DeleteLogController() {
        this.logUtilDao = new LogUtilDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        if (id == null || id.isEmpty()) {
            req.setAttribute("error", "Log không tồn tại");
            return;
        }

        logUtilDao.deleteLog(Integer.parseInt(id));
        req.setAttribute("successful", "Log đã bị xóa");
        req.getRequestDispatcher("/listLog").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
