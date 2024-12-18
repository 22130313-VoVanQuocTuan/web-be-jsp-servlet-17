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

@WebServlet(name = "updateInfo" , value = "/update-info")
public class UpdateInfoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        UserService userService = new UserService();
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            int id = user.getId(); // Lấy ID từ session

            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");

            // Kiểm tra dữ liệu đầu vào
            if (fullName == null || email == null || phoneNumber == null || address == null) {
                request.setAttribute("verificationRequested", false);
                request.setAttribute("error_info", "Dữ liệu không hợp lệ");
                request.getRequestDispatcher("/informationCustomer").forward(request, response); // Forward về trang lỗi
                return;
            }

            // Tạo đối tượng Users và gán dữ liệu từ form
            Users updatedUser = new Users(fullName, email, phoneNumber, address);
            userService.setUpdateInfoUser(id, updatedUser); // Gọi service để cập nhật thông tin người dùng

            // Chuyển hướng về trang thông báo hoặc danh sách người dùng
            response.sendRedirect(request.getContextPath() + "/informationCustomer");

        } catch (NumberFormatException e) {
            request.setAttribute("verificationRequested", false);
            request.setAttribute("error_info", "ID không hợp lệ");
            request.getRequestDispatcher("/informationCustomer").forward(request, response); // Forward về trang lỗi
        } catch (Exception e) {
            request.setAttribute("verificationRequested", false);
            request.setAttribute("error_info", "Lỗi khi cập nhật thông tin người dùng");
            request.getRequestDispatcher("/informationCustomer").forward(request, response); // Forward về trang lỗi
        }
    }
}