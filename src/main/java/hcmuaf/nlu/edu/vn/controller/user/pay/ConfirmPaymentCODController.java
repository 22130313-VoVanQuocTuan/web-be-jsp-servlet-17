package hcmuaf.nlu.edu.vn.controller.user.pay;

import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.ShippingAddress;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.CartService;
import hcmuaf.nlu.edu.vn.service.EmailUtilService;
import hcmuaf.nlu.edu.vn.service.OrderService;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ConfimPaymentontroller", value = "/payCOD")
public class ConfirmPaymentCODController extends HttpServlet {
    public final OrderService orderService = new OrderService();
    public final EmailUtilService emailUtilService = new EmailUtilService();
    public final ProductService productService = new ProductService();
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
        String status= "Chưa hoàn thành";
        String paymentStatus ="Chưa thanh toán ";

        // Lấy thông tin giỏ hàng từ session
        Double totalPrice = (Double) session.getAttribute("totalFinalPrice");
        Double shippingFee = (Double) session.getAttribute("totalShippingFee");
        Double discountAmount = (Double) session.getAttribute("totalDiscount");


        // Tạo đối tượng Orders
        Orders order = new Orders(userId,totalPrice,shippingFee,discountAmount,shippingAddress,paymentMethod,paymentStatus,status);
        // Tạo đơn hàng và lấy orderId
        // CAPTCHA
        String sessionCaptcha = (String) session.getAttribute("captcha"); // Lấy CAPTCHA từ session
        String userCaptcha = request.getParameter("captcha"); // Lấy CAPTCHA nhập từ form

        System.out.println("Session CAPTCHA: " + sessionCaptcha);
        System.out.println("User nhập CAPTCHA: " + userCaptcha);
        System.out.println("Session ID: " + session.getId());

        if (sessionCaptcha == null) {
            request.setAttribute("captchaError", "Lỗi: CAPTCHA không tồn tại. Vui lòng thử lại.");
            request.setAttribute("showModalCOD", true); // Giữ lại modal COD
            request.getRequestDispatcher("users/page/confirmation.jsp").forward(request, response);
            return;
        }

        if (!sessionCaptcha.equals(userCaptcha)) {
            request.setAttribute("captchaError", "Sai CAPTCHA. Vui lòng nhập lại.");
            request.setAttribute("showModalCOD", true); // Giữ lại modal COD

            // Giữ lại thông tin đã nhập
            String emailForm = request.getParameter("hidden_email");
            String nameForm = request.getParameter("hidden_name");
            String phoneNumberForm = request.getParameter("hidden_phoneNumber");
            String noteForm = request.getParameter("hidden_note");
            // Đưa các thông tin đã nhập vào request để JSP hiển thị lại
            request.setAttribute("shipping_address", new ShippingAddress(emailForm, nameForm,shippingAddress, phoneNumberForm, noteForm));

            // Giữ lại thông tin sản phẩm trong giỏ hàng khi CAPTCHA sai
            List<String> cartItemNames = Arrays.asList(request.getParameterValues("cartItemName"));
            List<String> cartItemQuantities = Arrays.asList(request.getParameterValues("cartItemQuantity"));
            List<String> cartItemTotalPrices = Arrays.asList(request.getParameterValues("cartItemTotalPrice"));

            // Đưa danh sách các mặt hàng vào request để hiển thị lại
            List<CartItems> cartItems = new ArrayList<>();
            for (int i = 0; i < cartItemNames.size(); i++) {
                String nameItem = cartItemNames.get(i);
                int quantityForm = Integer.parseInt(cartItemQuantities.get(i));
                double totalPriceForm = Double.parseDouble(cartItemTotalPrices.get(i));
                cartItems.add(new CartItems(nameItem, quantityForm, totalPriceForm));
            }
            request.setAttribute("itemCart", cartItems);

            request.getRequestDispatcher("users/page/confirmation.jsp").forward(request, response);
            return;
        }

        // Nếu CAPTCHA đúng, tiếp tục xử lý thanh toán...
        session.removeAttribute("captcha"); // Xóa CAPTCHA cũ để tránh nhập lại


        // Sau khi kiểm tra thành công, xóa CAPTCHA khỏi session để tránh nhập lại lần nữa
        session.removeAttribute("captcha_code");

      try {
          Orders o = orderService.addOrder(order);
          if (o != null) {
              // Lấy danh sách sản phẩm trong giỏ hàng từ session
              CartService cartService = new CartService();
              List<CartItems> cartItemsList = cartService.getCartFromSession(session).listItems();
              for (CartItems cartItem : cartItemsList) {
                  // Tạo đối tượng OrderItem từ CartItems || cartItem.getId() này là productID
                  OrderItem orderItem = new OrderItem(o.getId(), cartItem.getId(), cartItem.getQuantity(), cartItem.getPrice(), cartItem.getTotalPrice(), cartItem.getDiscountAmount());
                  orderService.addOrderItems(orderItem);

                  // Cập nhật soldCount trong bảng products
                  boolean isUpdated = productService.updateSoldCountProduct(cartItem.getId(), cartItem.getQuantity());
                  if (!isUpdated) {
                      System.out.println("Failed to update soldCount for product ID: " + cartItem.getId());
                  }
              }
              session.setAttribute("message", "Đặt hàng thành công");
              String emailContent = "<html>"
                      + "<body>"
                      + "<h2>Cảm ơn bạn đã đặt hàng tại cửa hàng của chúng tôi!</h2>"
                      + "<p>Chúng tôi đã nhận được đơn hàng của bạn và đang xử lý thanh toán.</p>"
                      + "<p>Thông tin đơn hàng của bạn:</p>"
                      + "<ul>"
                      + "<li><strong>Số đơn hàng:</strong>"+o.getId()+"</li>"
                      + "<li><strong>Tổng tiền:</strong>"+totalPrice+"₫"+"</li>"
                      + "</ul>"
                      + "<p>Chúng tôi sẽ thông báo cho bạn khi đơn hàng của bạn được giao.</p>"
                      + "<p>Chân thành cảm ơn sự tin tưởng của bạn!</p>"
                      + "<footer>"
                      + "<p>Trân trọng,<br> Cửa hàng Vật liệu Xây dựng</p>"
                      + "</footer>"
                      + "</body>"
                      + "</html>";

              emailUtilService.sendEmailAsync(user.getEmail(), "Xác nhận thanh toán", emailContent);

              session.removeAttribute("cart");
              response.sendRedirect(request.getContextPath()+ "/turn-page?action=checkpay");
              // Nếu tất cả thành công, chuyển hướng tới trang thanh toán thành công
          }else{
              session.setAttribute("message", "Thanh toán thất bại");
              response.sendRedirect(request.getContextPath()+ "/turn-page?action=checkpay");
          }
      }catch (SQLException e) {
          throw new RuntimeException(e);
      }

    }
}
