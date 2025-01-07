package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.Orders.DeleteOrderDao;
import hcmuaf.nlu.edu.vn.dao.Orders.OrderDao;
import hcmuaf.nlu.edu.vn.dao.Orders.AddOrderDao;
import hcmuaf.nlu.edu.vn.model.*;

import java.sql.SQLException;
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
    public Users getInfoUser(int id){
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

    //Xoá hoá đơn
    public boolean deleteOrder(int id) throws SQLException {
        return deleteOrderDao.deleteOrder(id);
    }

    public boolean deleteOrderItem(int id) throws SQLException {
        return deleteOrderDao.deleteOrderItem(id);
    }

    //Cập nhật hoá đơn
    public boolean updateOrderStatus(int id, String status) throws SQLException {
        return  orderDao.updateOrderStatus(id, status);
    }
}
