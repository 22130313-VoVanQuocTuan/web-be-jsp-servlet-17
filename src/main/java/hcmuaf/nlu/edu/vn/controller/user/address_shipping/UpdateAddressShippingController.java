package hcmuaf.nlu.edu.vn.controller.user.address_shipping;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.AddressShippingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UpdateInfoShipping", value = "/update-info-shipping")
public class UpdateAddressShippingController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            HttpSession session = req.getSession();
            Users user = (Users) session.getAttribute("user");
            int id = user.getId();

            String email = req.getParameter("email");
            String address = req.getParameter("address");
            String name = req.getParameter("name");
            String phoneNumber = req.getParameter("phoneNumber");
            String note = req.getParameter("note");
            if (note == null) {
                note = ""; // Gán giá trị rỗng
            }

            AddressShippingService service = new AddressShippingService();
            if(service.updateInfoShipping(id, email, name, address, phoneNumber, note)){
                resp.sendRedirect(req.getContextPath()+ "/confirmation");
            }
            else{
                req.setAttribute("error", "Cập nhật thất bại");
                req.getRequestDispatcher("/confirmation").forward(req, resp);
            }



        }catch(Exception e){
            e.printStackTrace(); // Ghi log lỗi chi tiết
            req.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại");
            req.getRequestDispatcher("/confirmation").forward(req, resp);
        }



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
