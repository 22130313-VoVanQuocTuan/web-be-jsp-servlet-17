package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Orders;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class DeleteOrderDao {
    private final DBConnect dbConnect;

    public DeleteOrderDao() {
        this.dbConnect = new DBConnect();
    }

    // Xóa các bản order
    public boolean deleteOrder(int id) throws SQLException {
        String deleteOrderQuery = "DELETE FROM orders WHERE id = ?";
        try (PreparedStatement psDeleteOrder = dbConnect.preparedStatement(deleteOrderQuery)) {
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

    //Cập nhật số lượng khi huỷ đơn hàng
    public void restoreSoldCountProduct(int orderId) {
        String getOrderItemsQuery = "SELECT productId, quantity FROM orderitems WHERE orderId = ?";
        try (PreparedStatement psGetOrderItems = dbConnect.preparedStatement(getOrderItemsQuery)) {
            psGetOrderItems.setInt(1,orderId);
            ResultSet rs = psGetOrderItems.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int quantity = rs.getInt("quantity");

                // Cập nhật lại bảng sản phẩm
                String updateProductQuery = "UPDATE products SET quantity = quantity + ?, soldCount = soldCount - ? WHERE id = ?";
                try (PreparedStatement psUpdateProduct = dbConnect.preparedStatement(updateProductQuery)) {
                    psUpdateProduct.setInt(1, quantity);
                    psUpdateProduct.setInt(2, quantity);
                    psUpdateProduct.setInt(3, productId);
                    psUpdateProduct.executeUpdate();
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public boolean cancelOrder(int id) throws SQLException {
        String checkOrderQuery = "SELECT createdAt FROM orders WHERE id = ?";
        try (PreparedStatement psCheckOrder = dbConnect.preparedStatement(checkOrderQuery)) {
            psCheckOrder.setInt(1, id);
            ResultSet rs = psCheckOrder.executeQuery();

            // Kiểm tra xem đơn hàng có tồn tại không
            if (rs.next()) {
                Timestamp createdAt = rs.getTimestamp("createdAt");
                LocalDateTime createdDateTime = createdAt.toLocalDateTime();
                LocalDateTime now = LocalDateTime.now();

                // Kiểm tra thời gian đã quá 2 ngày chưa
                long daysDifference = ChronoUnit.DAYS.between(createdDateTime, now);
                if (daysDifference > 2) {
                    // Nếu đã quá 2 ngày, không cho phép xóa
                    return false;
                }

                // Nếu chưa quá 2 ngày, tiến hành xóa các mục trong bảng orderitems
                restoreSoldCountProduct(id);
                String deleteOrderItemsQuery = "DELETE FROM orderitems WHERE orderId = ?";
                try (PreparedStatement psDeleteOrderItems = dbConnect.preparedStatement(deleteOrderItemsQuery)) {
                    psDeleteOrderItems.setInt(1, id);
                    int rowsDeletedItems = psDeleteOrderItems.executeUpdate();

                    // Kiểm tra xem việc xóa mục trong orderitems có thành công không
                    if (rowsDeletedItems > 0) {
                        // Sau khi xóa các mục trong orderitems, hủy đơn hàng trong bảng orders
                        String deleteOrderQuery = "DELETE FROM orders WHERE id = ?";
                        try (PreparedStatement psDeleteOrder = dbConnect.preparedStatement(deleteOrderQuery)) {
                            psDeleteOrder.setInt(1, id);
                            int rowsDeletedOrder = psDeleteOrder.executeUpdate();

                            // Kiểm tra xem việc xóa đơn hàng có thành công không
                            if (rowsDeletedOrder > 0) {
                                return true;
                            }
                        }
                    }
                }
            } else {
                System.out.println("Không tìm thấy đơn hàng với ID: " + id);
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi xóa đơn hàng", e);
        }
        return false;
    }



}
