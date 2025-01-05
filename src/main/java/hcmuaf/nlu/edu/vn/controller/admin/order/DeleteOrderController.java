package hcmuaf.nlu.edu.vn.controller.admin.order; import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteOrderController", value = "/delete-order")
public class DeleteOrderController extends HttpServlet {
    private final OrderService orderService;

    public DeleteOrderController() {
        orderService = new OrderService();
    }

@Override protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    try {
        if(orderService.deleteOrder(id)){
            response.sendRedirect(request.getContextPath()+"/order-list");
        }else{
            request.setAttribute("error", "Xóa hoá đơn thất bại.");
            request.getRequestDispatcher("/order-list").forward(request, response);
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
}
@Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}