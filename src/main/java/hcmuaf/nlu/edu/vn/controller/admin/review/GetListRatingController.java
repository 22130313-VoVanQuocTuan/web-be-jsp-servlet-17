package hcmuaf.nlu.edu.vn.controller.admin.review;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Rating;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.RatingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "ListRating", value = "/list-rating")
public class GetListRatingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("application/json");
       resp.setCharacterEncoding("UTF-8");
        RatingService ratingService = new RatingService();

        try{
            List<Rating> listRating = ratingService.getListRating();
            Gson gson = new Gson();
            String json = gson.toJson(listRating);
            resp.getWriter().write(json);


        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
