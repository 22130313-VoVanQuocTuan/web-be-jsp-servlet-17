package hcmuaf.nlu.edu.vn.controller.admin.review;

import hcmuaf.nlu.edu.vn.service.RatingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteRating", value = "/delete-rating")
public class DeleteRatingController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
         RatingService ratingService = new RatingService();
        try {
            if (ratingService.deleteRating(id)) {
                PrintWriter out = resp.getWriter();
                out.println("{\"message\": \"Xóa thành công.\"}");
                out.flush();
            } else {
                PrintWriter out = resp.getWriter();
                out.println("{\"error\": true, \"message\":\"Xóa thất bại.\"}");
                out.flush();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
