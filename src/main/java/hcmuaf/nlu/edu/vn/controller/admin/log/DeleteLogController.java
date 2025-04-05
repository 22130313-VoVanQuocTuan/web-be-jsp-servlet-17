package hcmuaf.nlu.edu.vn.controller.admin.log;

import hcmuaf.nlu.edu.vn.util.logUtil.LogUtilDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/delete-Log")
public class DeleteLogController extends HttpServlet {
    private LogUtilDao logUtilDao ;

    public DeleteLogController() {
        this.logUtilDao = new LogUtilDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");
        String id = req.getParameter("logId");
        if (id == null || id.isEmpty()) {
            PrintWriter out = resp.getWriter();
            out.println("{\"error\": true, \"message\":\"Xóa thất bại.\"}");
            out.flush();
            return;
        }

        logUtilDao.deleteLog(Integer.parseInt(id));
        PrintWriter out = resp.getWriter();
        out.println("{\"message\":\"Xóa thành công\"}");
        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
