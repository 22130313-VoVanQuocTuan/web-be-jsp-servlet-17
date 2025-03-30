package hcmuaf.nlu.edu.vn.dao.products;

import hcmuaf.nlu.edu.vn.dao.DBConnect;

import java.sql.*;
import java.util.*;

public class RevenueDAO {
    private static DBConnect dbConnect;

    public RevenueDAO() {
        this.dbConnect = new DBConnect();
    }

    public List<Map<String, Object>> getWeeklyRevenue() {
        List<Map<String, Object>> revenueList = new ArrayList<>();
        String sql = """
            SELECT 
                CONCAT(
                    'Tuần ', WEEK(updatedAt, 1), ' (', 
                    DATE_FORMAT(DATE_SUB(updatedAt, INTERVAL WEEKDAY(updatedAt) DAY), '%d/%m'), 
                    ' - ', 
                    DATE_FORMAT(DATE_ADD(DATE_SUB(updatedAt, INTERVAL WEEKDAY(updatedAt) DAY), INTERVAL 6 DAY), '%d/%m'), 
                    ')'
                ) AS week_label, 
                SUM(totalPrice) AS revenue 
            FROM Orders 
            WHERE status = 'Đã hoàn thành' AND paymentStatus = 'Đã thanh toán' 
            GROUP BY YEARWEEK(updatedAt, 1) 
            ORDER BY YEARWEEK(updatedAt, 1);
        """;

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                data.put("week", rs.getString("week_label"));
                data.put("revenue", rs.getDouble("revenue"));
                revenueList.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueList;
    }

    public List<Map<String, Object>> getMonthlyRevenue() {
        List<Map<String, Object>> revenueList = new ArrayList<>();
        String sql = """
            SELECT 
                DATE_FORMAT(updatedAt, '%Y-%m') AS month_label, 
                SUM(totalPrice) AS revenue 
            FROM Orders 
            WHERE status = 'Đã hoàn thành' AND paymentStatus = 'Đã thanh toán' 
            GROUP BY DATE_FORMAT(updatedAt, '%Y-%m') 
            ORDER BY DATE_FORMAT(updatedAt, '%Y-%m');
        """;

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                data.put("month", rs.getString("month_label"));
                data.put("revenue", rs.getDouble("revenue"));
                revenueList.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueList;
    }
    public List<Map<String, Object>> getYearlyRevenue() {
        List<Map<String, Object>> revenueList = new ArrayList<>();
        String sql = """
            SELECT 
                YEAR(updatedAt) AS year_label, 
                SUM(totalPrice) AS revenue 
            FROM Orders 
            WHERE status = 'Đã hoàn thành' AND paymentStatus = 'Đã thanh toán' 
            GROUP BY YEAR(updatedAt) 
            ORDER BY YEAR(updatedAt);
        """;

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                data.put("year", rs.getInt("year_label"));
                data.put("revenue", rs.getDouble("revenue"));
                revenueList.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueList;
    }

}