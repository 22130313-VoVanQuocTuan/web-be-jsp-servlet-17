package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.ShippingAddress;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "ConfimPaymentontroller", value = "/payCOD")
public class ConfirmPaymentController extends HttpServlet {
    public final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("home.jsp"); // Redirect về trang chủ nếu truy cập GET
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login"); // Nếu chưa đăng nhập, điều hướng về trang đăng nhập
            return;
        }
        int userId = user.getId();
        // Lấy các giá trị từ form và session
        String shippingAddress = request.getParameter("shipping_address");
        String paymentMethod = "COD"; // lấy giá trị từ hidden field
        String status= "Đang xử lí ";
        String paymentStatus ="Chưa thanh toán ";

        // Lấy thông tin giỏ hàng từ session
        Double totalPrice = (Double) session.getAttribute("totalFinalPrice");
        Double shippingFee = (Double) session.getAttribute("totalShippingFee");
        Double discountAmount = (Double) session.getAttribute("totalDiscount");



        // Tạo đối tượng Orders
        Orders order = new Orders(userId,totalPrice,shippingFee,discountAmount,shippingAddress,paymentMethod,paymentStatus,status);

        // Tạo đơn hàng và lấy orderId
        boolean orderCreated = orderService.createOrder(order);

        if (orderCreated) {
            // Lấy orderId từ đối tượng Orders sau khi thêm vào cơ sở dữ liệu
            int orderId = order.getId();

            // Lấy danh sách sản phẩm trong giỏ hàng từ session
            List<CartItems> cartItemsList = (List<CartItems>) session.getAttribute("cart");

            for (CartItems cartItem : cartItemsList) {
                // Tạo đối tượng OrderItem từ CartItems
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderId(orderId); // Gán orderId cho OrderItem
                orderItem.setProductId(cartItem.getId()); // Lấy productId từ cartItem
                orderItem.setQuantity(cartItem.getQuantity()); // Lấy số lượng từ cartItem
                orderItem.setPrice(cartItem.getPrice()); // Lấy giá sản phẩm từ cartItem
                orderItem.setTotalPrice(cartItem.getTotalPrice()); // Tính tổng giá từ cartItem
                orderItem.setDiscount(cartItem.getDiscountAmount()); // Lấy mức giảm giá từ cartItem

                // Thêm OrderItem vào bảng orderitems
                boolean itemAdded = orderService.addOrderItem(orderItem);

                if (!itemAdded) {
                    response.getWriter().write("Lỗi khi thêm sản phẩm vào đơn hàng.");
                    return;
                }
            }

            // Nếu tất cả thành công, chuyển hướng tới trang thanh toán thành công
            response.sendRedirect("/confirmation");
        } else {
            response.getWriter().write("Lỗi khi tạo đơn hàng.");
        }
    }
}
