package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.home.HomeDao;

public class HomeService {
    private final HomeDao homeDao;

    public HomeService() {
        this.homeDao = new HomeDao();
    }

    // Tổng số lượt xem
    public int totalView() {
        return homeDao.totalView();
    }

    // Tổng số người dùng
    public int totalAccount() {
        return homeDao.totalAccount();
    }

    // Tổng số nhận xét
    public int totalRating() {
        return homeDao.totalRating();
    }

    // Tổng doanh thu
    public double totalSale() {
        return homeDao.totalSale();
    }
}
