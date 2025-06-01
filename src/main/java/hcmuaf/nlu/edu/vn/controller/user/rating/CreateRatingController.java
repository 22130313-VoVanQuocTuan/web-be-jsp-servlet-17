package hcmuaf.nlu.edu.vn.controller.user.rating;

import hcmuaf.nlu.edu.vn.model.Rating;
import hcmuaf.nlu.edu.vn.service.RatingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CreateRating", value = "/create-rating")
public class CreateRatingController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();

        try {
        int productId = Integer.parseInt(req.getParameter("productId"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        String content = req.getParameter("content");

        RatingService ratingService = new RatingService();
        Rating rating = new Rating(productId,userId,content);

            if (ratingService.addRating(rating)) {
                out.print("{\"status\":\"success\", \"message\":\"Đánh giá thành công\"}");
            } else {
                out.print("{\"status\":\"fail\", \"message\":\"Đánh giá thất bại\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"status\":\"error\", \"message\":\"Lỗi hệ thống\"}");
        }
        out.flush();
        out.close();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
