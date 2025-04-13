package hcmuaf.nlu.edu.vn.controller.user.account;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "updateInfo" , value = "/update-info")
public class UpdateInfoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        UserService userService = new UserService();
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            int id = user.getId(); // Lấy ID từ session

            String fullName = request.getParameter("fullName");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");

            // Tạo đối tượng Users và gán dữ liệu từ form
            Users updatedUser = new Users(fullName, phoneNumber, address);
            if (userService.setUpdateInfoUser(id, updatedUser)) {    // Gọi service để cập nhật thông tin người dùng
                PrintWriter out = response.getWriter();
                out.println("{\"message\":\"Cập nhật thông tin thành công!\"}");
                out.flush();
            } else {
                PrintWriter out = response.getWriter();
                out.println("{\"error\": true, \"message\":\"Cập nhật thất bại! Có ỗi xảy ra\"}");
                out.flush();
            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }}