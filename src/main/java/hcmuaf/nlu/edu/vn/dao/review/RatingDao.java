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
}
