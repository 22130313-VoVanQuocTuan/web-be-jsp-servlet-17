package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.products.ProductDao;
import hcmuaf.nlu.edu.vn.dao.products.RevenueDAO;

import java.util.List;
import java.util.Map;

public class RevenueService {
    private RevenueDAO revenueDAO;

    public RevenueService() {
        this.revenueDAO = new RevenueDAO();
    }

    public List<Map<String, Object>> getWeeklyRevenue() {
        return revenueDAO.getWeeklyRevenue();
    }
    public  List<Map<String, Object>> getMonthlyRevenue() {
        return revenueDAO.getMonthlyRevenue();
    }
    public List<Map<String, Object>> getYearlyRevenue() {
        return revenueDAO.getYearlyRevenue();
    }
}
