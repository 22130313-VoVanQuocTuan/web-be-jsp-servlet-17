package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.review.RatingDao;
import hcmuaf.nlu.edu.vn.model.Rating;

import java.util.List;

public class RatingService {
    private final RatingDao ratingDao;
    public RatingService() {
        ratingDao = new RatingDao();
    }

    // Lấy danh sách đánh giá
    public List<Rating> getListRating() {
        return ratingDao.getListRating();
    }

    //Xóa đánh giá
    public boolean deleteRating(int id) {
        return ratingDao.deleteRating(id);
    }
}
