package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.Orders.OrderDao;
import hcmuaf.nlu.edu.vn.dao.Orders.AddOrderDao;
import hcmuaf.nlu.edu.vn.model.*;

import java.sql.SQLException;
import java.util.List;

public class OrderService {
    public OrderDao orderDao;
    public AddOrderDao addOrderDao;


    public OrderService() {
        this.orderDao = new OrderDao();
        this.addOrderDao = new AddOrderDao();
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
    public OrderDetail getItemOrders(int id) throws SQLException {
        return orderDao.getOrderDetail(id);
    }

    //Lấy ra chi tiết hoá đơn
    public List<OrderItem> getOrderItems(int id) throws SQLException {
        return orderDao.orderItems(id);
    }

    //Lấy ra thông tin địa chỉ giao hàng
    public AddressShipping getInfoAddressShipping(int id) throws SQLException {
       return addOrderDao.getInfoAddressShipping(id);
    }


    //Xoá hoá đơn
    public boolean deleteOrder(int id) throws SQLException {
        return orderDao.deleteOrder(id);
    }

    //Cập nhật hoá đơn
    public boolean updateOrderStatus(int id, String status) throws SQLException {
        return  orderDao.updateOrderStatus(id, status);
    }

    //Cập nhật trạng thái thanh toán hoá đơn
    public boolean updateOrderPaymentStatus(int id, String status) throws SQLException {
        return  orderDao.updateOrderPaymentStatus(id, status);
    }



    //thêm hoá đơn
    public Orders addOrder(Orders order) throws SQLException {
        return addOrderDao.addOrder(order);
    }
    //thêm chi tiết hoá đơn
    public void addOrderItems(OrderItem order) throws SQLException {
        addOrderDao.addOrderItem(order);
    }
}
