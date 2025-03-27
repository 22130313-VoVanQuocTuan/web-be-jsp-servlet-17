package hcmuaf.nlu.edu.vn.controller.admin.review;

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
        RatingService ratingService = new RatingService();
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
            resp.sendRedirect(req.getContextPath() + "/logout");
            return;
        }
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
