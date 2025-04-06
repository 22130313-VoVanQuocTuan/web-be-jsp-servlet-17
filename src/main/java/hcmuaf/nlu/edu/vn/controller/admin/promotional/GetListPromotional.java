package hcmuaf.nlu.edu.vn.controller.admin.promotional;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Promotionals;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.PromotionalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "listPromotional", value = "/promotional-list")
public class GetListPromotional extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PromotionalService promotionalService = new PromotionalService();

        try {
            List<Promotionals> listPromotional = promotionalService.getListPromotional();
            Timestamp now = new Timestamp(System.currentTimeMillis());
            for (Promotionals promotional : listPromotional) {
                Timestamp endDate = promotional.getEndDate();
                if (now.after(endDate)) {
                    promotional.setStatus("Không hoạt động"); // hoặc false nếu là boolean
                    promotionalService.updateStatusProm("Không hoạt động"); // gọi service cập nhật
                }
            }
            Gson gson = new Gson();
            String json = gson.toJson(listPromotional);
            resp.getWriter().write(json);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
