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

    // Taạo đánh giá
    public boolean addRating(Rating rating) {
        return ratingDao.addRating(rating);
    }

    //Tìm kiếm theo tid sản phẩm
    public List<Rating> getListRatingByProductId(String productId) {
        return ratingDao.getListRattingByProductId(productId);
    }

    public List<Rating> getRatingsByProductId(int productId) {
        return ratingDao.getRatingsByProductId(productId);
    }
}
