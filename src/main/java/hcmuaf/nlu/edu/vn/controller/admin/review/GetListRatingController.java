package hcmuaf.nlu.edu.vn.controller.admin.review;

import hcmuaf.nlu.edu.vn.model.Rating;
import hcmuaf.nlu.edu.vn.service.RatingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListRating", value = "/list-rating")
public class GetListRatingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RatingService ratingService = new RatingService();

        try{
            List<Rating> listRating = ratingService.getListRating();
            req.setAttribute("listRating", listRating);
            req.getRequestDispatcher( "/admin/pages/review.jsp").forward(req, resp);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
