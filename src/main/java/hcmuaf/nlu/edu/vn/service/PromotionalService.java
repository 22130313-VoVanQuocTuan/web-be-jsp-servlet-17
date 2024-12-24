package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.promotional.PromotionalDao;
import hcmuaf.nlu.edu.vn.model.Promotionals;

import java.sql.Timestamp;
import java.util.List;

public class PromotionalService {
    private final PromotionalDao promotionalDao;
    public PromotionalService() {
        this.promotionalDao = new PromotionalDao();
    }


    // Lấy ra danh sách ưu đãi
    public List<Promotionals> getListPromotional() {
        return promotionalDao.getListPromotional();
    }
    //thêm ưu đãi
    public boolean addPromotional(String code, double value, Timestamp startDate, Timestamp endDate, String status) {
        return promotionalDao.addPromotional(code, value, startDate, endDate,status);
    }

    //Xóa ưu đãi
    public boolean deletePromotional(int id) {
        return promotionalDao.deletePromotion(id);
    }
}
