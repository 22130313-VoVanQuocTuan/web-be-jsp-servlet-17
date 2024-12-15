package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.Orders.OrderDao;
import hcmuaf.nlu.edu.vn.model.Orders;

import java.sql.SQLException;
import java.util.List;

public class OrderService {
    public OrderDao orderDao;

    public OrderService() {
        this.orderDao = new OrderDao();
    }

    public List<Orders> getAllOrders() throws SQLException {
        return orderDao.getAllOrders();
    }
}
