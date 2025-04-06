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
                'Tuần ', WEEK(createdAt, 1), ' (', 
                DATE_FORMAT(DATE_SUB(createdAt, INTERVAL WEEKDAY(createdAt) DAY), '%d/%m'), 
                ' - ', 
                DATE_FORMAT(DATE_ADD(DATE_SUB(createdAt, INTERVAL WEEKDAY(createdAt) DAY), INTERVAL 6 DAY), '%d/%m'), 
                ')'
            ) AS week_label, 
            SUM(totalPrice) AS revenue 
        FROM Orders 
        WHERE paymentStatus = 'Đã thanh toán' AND status = 'Hoàn thành'
        GROUP BY YEARWEEK(createdAt, 1) 
        ORDER BY YEARWEEK(createdAt, 1);
    """;

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                data.put("week", rs.getString("week_label"));
                data.put("revenue", rs.getDouble("revenue"));
                revenueList.add(data);
            }
            System.out.println("Weekly revenue data: " + revenueList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueList;
    }

    public List<Map<String, Object>> getMonthlyRevenue() {
        List<Map<String, Object>> revenueList = new ArrayList<>();
        String sql = """
        SELECT 
            DATE_FORMAT(createdAt, '%Y-%m') AS month_label, 
            SUM(totalPrice) AS revenue 
        FROM Orders 
        WHERE paymentStatus = 'Đã thanh toán' AND status = 'Hoàn thành'
        GROUP BY DATE_FORMAT(createdAt, '%Y-%m') 
        ORDER BY DATE_FORMAT(createdAt, '%Y-%m');
    """;

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                data.put("month", rs.getString("month_label"));
                data.put("revenue", rs.getDouble("revenue"));
                revenueList.add(data);
            }
            System.out.println("Monthly revenue data: " + revenueList); // Log để kiểm tra
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueList;
    }
    public List<Map<String, Object>> getYearlyRevenue() {
        List<Map<String, Object>> revenueList = new ArrayList<>();
        String sql = """
        SELECT 
            YEAR(createdAt) AS year_label, 
            SUM(totalPrice) AS revenue 
        FROM Orders 
        WHERE paymentStatus = 'Đã thanh toán' AND status = 'Hoàn thành'
        GROUP BY YEAR(createdAt) 
        ORDER BY YEAR(createdAt);
    """;

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                data.put("year", rs.getInt("year_label"));
                data.put("revenue", rs.getDouble("revenue"));
                revenueList.add(data);
            }
            System.out.println("Yearly revenue data: " + revenueList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueList;
    }
}