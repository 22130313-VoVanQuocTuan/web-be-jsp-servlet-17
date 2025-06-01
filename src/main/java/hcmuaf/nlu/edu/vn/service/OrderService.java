package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.Orders.DeleteOrderDao;
import hcmuaf.nlu.edu.vn.dao.Orders.OrderDao;
import hcmuaf.nlu.edu.vn.dao.Orders.AddOrderDao;
import hcmuaf.nlu.edu.vn.model.*;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.List;

public class OrderService {
    public OrderDao orderDao;
    public AddOrderDao addOrderDao;
    public DeleteOrderDao deleteOrderDao;


    public OrderService() {
        this.orderDao = new OrderDao();
        this.addOrderDao = new AddOrderDao();
        this.deleteOrderDao = new DeleteOrderDao();
    }

    //Lấy ra tất cả danh sách hoá đơn
    public List<Orders> getAllOrders() throws SQLException {
        return orderDao.getAllOrders();
    }

    //Lấy danh sách đơn hàng theo id
    public List<Orders> getOrderById(int id) throws SQLException {
        return orderDao.getOrderById(id);
    }

    // Lấy thông tin người dùng
    public Users getInfoUser(int id) {
        return orderDao.getInfoUser(id);
    }

    //Xem chi tiết hoá đơn
    public Orders getItemOrders(int id) throws SQLException {
        return orderDao.getOrderDetail(id);
    }

    //Lấy ra chi tiết hoá đơn
    public List<OrderItem> getOrderItems(int id) throws SQLException {
        return orderDao.orderItems(id);
    }
    // hàm xoas hóa đơn trong thông tinn khách hàng
    public boolean cancelOrder(int id) throws SQLException {
        return deleteOrderDao.cancelOrder(id);
    }
    //Xoá hoá đơn
    public boolean deleteOrder(int id) throws SQLException {
        return deleteOrderDao.deleteOrder(id);
    }

    public boolean deleteOrderItem(int id) throws SQLException {
        return deleteOrderDao.deleteOrderItem(id);
    }

    //Cập nhật hoá đơn
    public boolean updateOrderStatusPay(int id, String status) throws SQLException {
        return orderDao.updateOrderStatusPay(id, status);
    }

    //Cập nhật trạng thái thanh toán hoá đơn
    public boolean updateOrderPaymentStatus(int id, String status) throws SQLException {
        return orderDao.updateOrderPaymentStatus(id, status);
    }
    //Cập nhật trạng thái hoá đơn khi cập nhật trong admin
    public boolean updateOrderStatus(int id, String status) throws SQLException {
        return orderDao.updateOrderStatus(id, status);
    }

    //thêm hoá đơn
    public Orders addOrder(Orders order) throws SQLException {
        return addOrderDao.addOrder(order);
    }

    //thêm chi tiết hoá đơn
    public void addOrderItems(OrderItem order) throws SQLException {
        addOrderDao.addOrderItem(order);
    }
    // Đếm số lượng đơn hàng chưa hoàn thành( cần vận chuyển)
    public int getPendingOrderCount() throws SQLException {
        return orderDao.getPendingOrderCount();
    }
}
