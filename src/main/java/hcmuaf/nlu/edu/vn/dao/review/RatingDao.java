package hcmuaf.nlu.edu.vn.dao.review;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Rating;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RatingDao {
    private final DBConnect dbConnect;

    public RatingDao() {
        dbConnect = new DBConnect();
    }

    // Lấy danh sách đánh giá
    public List<Rating> getListRating() {
        String sql = "select * from rating";

        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ResultSet rs = ptm.executeQuery();
            List<Rating> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                int productId = rs.getInt("productId");
                int userId = rs.getInt("userId");
                String content = rs.getString("content");
                Date createdAt = rs.getDate("createdAt");

                Rating rating = new Rating(id, productId, userId, content, createdAt);
                list.add(rating);
            }
            return list;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    // Xóa đánh giá
    public boolean deleteRating(int id) {
        String sql = "delete from rating where id = ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, id);
            int row = ptm.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //Thêm đánh giá
    public boolean addRating(Rating rating) {
        String sql = "INSERT INTO rating (productId, userId, content, createdAt) VALUES (?,?,?,NOW())";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, rating.getProductId());
            ptm.setInt(2, rating.getUserId());
            ptm.setString(3, rating.getContent());

            int row = ptm.executeUpdate();
            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public List<Rating> getListRattingByProductId(String productId) {
        String sql = "SELECT * FROM rating WHERE productId LIKE ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, "%" + productId + "%");
            ResultSet rs = ptm.executeQuery();
            List<Rating> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                int productID = rs.getInt("productId");
                int userId = rs.getInt("userId");
                String content = rs.getString("content");
                Date createdAt = rs.getDate("createdAt");

                Rating rating = new Rating(id, productID, userId, content, createdAt);
                list.add(rating);
            }
            return list;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

//    // LẤY RA TẤT CẢ ĐÁNH GIÁ .
//    public List<Rating> getAllRatings() {
//        List<Rating> ratings = new ArrayList<>();
//        String sql = "SELECT * FROM rating WHERE isDeleted = FALSE";
//        try (PreparedStatement ptm = dbConnect.preparedStatement(sql);
//             ResultSet rs = ptm.executeQuery()) {
//            while (rs.next()) {
//                ratings.add(new Rating(
//                        rs.getInt("id"),
//                        rs.getInt("productId"),
//                        rs.getInt("userId"),
//                        rs.getString("content"),
//                        rs.getDate("createdAt"),
//                        rs.getBoolean("isDeleted")
//                ));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return ratings;
//    }
//
//    // XÓA ĐÁNH GIÁ .
//    public boolean hideRating(int id) {
//        String sql = "UPDATE rating SET isDeleted = TRUE WHERE id = ?";
//
//        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
//            ptm.setInt(1, id);
//            int row = ptm.executeUpdate();
//            return row > 0;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    //KHÔI PHỤC ĐÁNH GIÁ ĐÃ XÓA .
//    public boolean restoreRating(int id) {
//        String sql = "UPDATE rating SET isDeleted = FALSE WHERE id = ?";
//
//        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
//            ptm.setInt(1, id);
//            int row = ptm.executeUpdate();
//            return row > 0;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }

}
