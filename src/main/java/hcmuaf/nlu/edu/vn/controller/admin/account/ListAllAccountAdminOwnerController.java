package hcmuaf.nlu.edu.vn.controller.admin.account;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.userdetails.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "GetAdminOwner" , value = "/list_admin_owner")
public class ListAllAccountAdminOwnerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        UserService userService = new UserService();
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("owner") && !user.getRole().equals("admin"))) {
            resp.sendRedirect(req.getContextPath() + "/logout");
            return;
        }
        try {
            List<Users> list = userService.getListUsers();

            List<Users> filteredUsers = list.stream()
                            .filter(users -> "admin".equals(users.getRole()) || "owner".equals(users.getRole()))
                                    .collect(Collectors.toList());

            Gson gson = new Gson();
            String json = gson.toJson(filteredUsers);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}


