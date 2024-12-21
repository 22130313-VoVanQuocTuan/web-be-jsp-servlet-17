package hcmuaf.nlu.edu.vn.dao.products;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Promotionals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PromotionalDao {
    private final DBConnect dbConnect;

    public PromotionalDao() {
        dbConnect = new DBConnect();
    }

    public List<Promotionals> getListPromotional() {
        String sql = "select code,value  from promotional ";
        List<Promotionals> list = new ArrayList<>();
        try (PreparedStatement pstmt = dbConnect.preparedStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String code = rs.getString("code");
                double value = rs.getDouble("value");
                Promotionals p = new Promotionals(code, value);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
