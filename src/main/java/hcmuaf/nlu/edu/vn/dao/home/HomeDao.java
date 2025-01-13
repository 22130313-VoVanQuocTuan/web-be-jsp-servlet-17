package hcmuaf.nlu.edu.vn.dao.home;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HomeDao {
    final DBConnect dbConnect;

    public HomeDao() {
        this.dbConnect = new DBConnect();
    }

    // Tổng số lượt xem
    public int totalView() {
        String sql = "SELECT SUM(view) FROM products";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0; // Trả về 0 nếu không có kết quả
    }

    // Tổng số người dùng
    public int totalAccount() {
        String sql = "SELECT COUNT(*) FROM users";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0; // Trả về 0 nếu không có kết quả
    }

    // Tổng số nhận xét
    public int totalRating() {
        String sql = "SELECT COUNT(*) FROM rating";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0; // Trả về 0 nếu không có kết quả
    }

    // Tổng doanh thu
    public double totalSale() {
        String sql = "SELECT SUM(totalPrice) FROM orders where status = 'Đã hoàn thành'";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Double total = rs.getDouble(1);
                return total != null ? total : 0.0;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0.0; // Trả về 0 nếu không có kết quả
    }

    //Lâấy ra danh sách khách hàng tiềm năng
    public List<Users> getUserPotential() {
        List<Users> users = new ArrayList<Users>();
        String query = "SELECT fullName, SUM(o.totalPrice) AS total FROM users u JOIN orders o ON u.id = o.userId GROUP BY fullName ORDER BY total DESC";
        try (PreparedStatement preparedStatement = dbConnect.preparedStatement(query)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setFullName(rs.getString("fullName"));
                user.setTotalPrice(rs.getDouble("total"));

                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    //Lấy ra danh sách hoá đơn gần nhất
    public List<Orders> getOrderNew() {
        List<Orders> orders = new ArrayList<>();
        String query = "SELECT * FROM orders ORDER BY createdAt DESC";
        try (PreparedStatement preparedStatement = dbConnect.preparedStatement(query)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.setUserid(rs.getInt("userId"));
                order.setTotalPrice(rs.getDouble("totalPrice"));
                order.setPaymentStatus(rs.getString("paymentStatus"));
                order.setStatus(rs.getString("status"));
                order.setCreatedAt(rs.getTimestamp("createdAt"));

                orders.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return orders;
    }

}
