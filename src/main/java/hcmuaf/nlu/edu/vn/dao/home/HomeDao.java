package hcmuaf.nlu.edu.vn.dao.home;

import hcmuaf.nlu.edu.vn.dao.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        String sql = "SELECT SUM(totalPrice) FROM orders";
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


}
