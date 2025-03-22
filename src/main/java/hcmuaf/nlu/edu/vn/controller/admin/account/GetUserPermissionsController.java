package hcmuaf.nlu.edu.vn.controller.admin.account;


import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

@WebServlet(name = "get_user_permissions", value = "/get_user_permissions")
public class GetUserPermissionsController extends HttpServlet {
    private final UserService userService;


    public GetUserPermissionsController() {
        this.userService = new UserService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("userId");
        String module = req.getParameter("module"); // Lấy module
        System.out.println("module = " + module);
        System.out.println("userId = " + userId);
        Map<String, Boolean> permissions = userService.getUserPermissions(userId, module);

        // Chuyển đổi sang JSON để gửi về client
        Gson gson = new Gson();
        String json = gson.toJson(permissions);
        System.out.println("JSON Response: " + json); // In ra console để kiểm tra

        resp.setContentType("application/json");

        resp.getWriter().write(json);
    }
}

