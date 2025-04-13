package hcmuaf.nlu.edu.vn.controller.user.carts;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
import hcmuaf.nlu.edu.vn.dao.carts.Carts;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "cart-items", value = "/cart-items")
public class GetListCartItems  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        if (session == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.getWriter().write("{\"error\": true, \"message\": \"Chưa đăng nhập hoặc không có giỏ hàng.\"}");
            return;
        }
        Carts carts = (Carts) session.getAttribute("cart");
        if (carts == null) {
            // Nếu giỏ hàng không tồn tại, khởi tạo giỏ hàng mới
            carts = new Carts();
            session.setAttribute("cart", carts);
        }

        List<CartItems> listItems = carts.listItems(); // Lấy danh sách CartItems từ Carts

        if (listItems == null || listItems.isEmpty()) {
            req.setAttribute("listItems", null); // Nếu giỏ hàng rỗng
        } else {
            req.setAttribute("listItems", listItems); // Nếu có danh sách các item
        }
        //lấy ra tổng số lượng ,tổng  giá

        // tổng giá các sa phẩm
        double totalPrice =  carts.getTotalPrice();
        session.setAttribute("totalPrice", totalPrice);

        //Tổng gia giá
        double totalDiscount =  carts.getDiscount();
        session.setAttribute("totalDiscount", totalDiscount);

        //Tổng phí ship
        double totalShippingFee = carts.getTotalPriceShippingFee();
        session.setAttribute("totalShippingFee", totalShippingFee);

        // Tổng tiền cần thanh toán
        double totalFinalPrice = carts.getFinalTotalPrice();
        session.setAttribute("totalFinalPrice", totalFinalPrice);

        // tổng số lượng sản phâm trong giỏ
        int totalItem = carts.getTotalItem();
        session.setAttribute("cartItemCount", totalItem); // Lưu số lượng sản phẩm vào session

        Map<String, Object> model = new HashMap<>();
        model.put("totalPrice", totalPrice);
        model.put("totalShippingFee", totalShippingFee);
        model.put("totalFinalPrice", totalFinalPrice);
        model.put("totalItem", totalItem);
        model.put("cartItems", listItems);


        Gson gson = new Gson();
        String json = gson.toJson(model);
        resp.getWriter().write(json);
}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}