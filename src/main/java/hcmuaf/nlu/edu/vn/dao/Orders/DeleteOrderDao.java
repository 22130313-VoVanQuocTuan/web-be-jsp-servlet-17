package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteOrderDao {
    private final DBConnect dbConnect;

    public DeleteOrderDao() {
        this.dbConnect = new DBConnect();
    }

    // Xóa các bản order
    public boolean deleteOrder(int id) throws SQLException {

        String deleteOrderQuery = "DELETE FROM orders WHERE id = ?";

        try (
                PreparedStatement psDeleteOrder = dbConnect.preparedStatement(deleteOrderQuery)) {

            // Xóa hóa đơn từ bảng orders
            psDeleteOrder.setInt(1, id);
            int orderDeleted = psDeleteOrder.executeUpdate();

            if (orderDeleted > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    //Xoá chi tiết hoá đơn
    public boolean deleteOrderItem(int id) {
        String deleteOrderItemsQuery = "DELETE FROM orderitems WHERE orderId = ?";
        try (PreparedStatement psDeleteOrderItems = dbConnect.preparedStatement(deleteOrderItemsQuery)) {
            psDeleteOrderItems.setInt(1, id);
            int row = psDeleteOrderItems.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
