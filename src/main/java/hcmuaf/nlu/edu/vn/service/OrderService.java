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

    //Lấy danh sách đơn hàng
    public List<Orders> getAllOrders() throws SQLException {
        return orderDao.getAllOrders();
    }

    // Lấy thông tin người dùng
    public Users getInfoUser(int id){
        return orderDao.getInfoUser(id);
    }

    //Xem chi tiết hoá đơn
    public List<ItemOrder> getItemOrders(int id) throws SQLException {
        return orderDao.getOrderItems(id);
    }

    public AddressShipping getInfoAddressShipping(int id) throws SQLException {
       return addOrderDao.getInfoAddressShipping(id);
    }

    public Payments getPayment(int id) throws SQLException {
        return addOrderDao.getPayment(id);
    }
}
