package hcmuaf.nlu.edu.vn.util.logUtil;

import hcmuaf.nlu.edu.vn.dao.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LogUtilDao {
    private static DBConnect dbConnect;

    public LogUtilDao() {
        dbConnect = new DBConnect();

    }


    public static void log(LogLevel level, String username, String address, String dataBefore, String dataAfter) throws SQLException {
        String sql = "INSERT INTO LogHistory (level, username, startLog, address, dataBefore, dataAfter) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = dbConnect.preparedStatement(sql)) {

            pstmt.setString(1, level.name());
            pstmt.setString(2, username);
            pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));
            pstmt.setString(4, address);
            pstmt.setString(5, dataBefore);
            pstmt.setString(6, dataAfter);

            pstmt.executeUpdate();
        }
    }


    public void deleteLog(int id) {
        String sql = "DELETE FROM LogHistory WHERE id = ?";

        try (PreparedStatement pstmt = dbConnect.preparedStatement(sql)) {

            pstmt.setInt(1, id);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Log ID " + id + " deleted successfully.");
            } else {
                System.out.println("Log ID not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Log> getListLog() {
        String sql = "SELECT * FROM loghistory ORDER BY startLog DESC";
        List<Log> logs = new ArrayList<>();
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Log log = new Log();
                log.setId(rs.getInt("id"));
                log.setLevel(rs.getString("level"));
                log.setUsername(rs.getString("username"));
                log.setAddress(rs.getString("address"));
                Timestamp timestamp = rs.getTimestamp("startLog");
                if (timestamp != null) {
                    log.setStartLog(timestamp);  // Lưu trực tiếp Timestamp
                }
               log.setDataBefore(rs.getString("dataBefore"));
                log.setDataAfter(rs.getString("dataAfter"));
                logs.add(log);

            }
            return logs;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void cleanLog(String level) throws SQLException {
        String sql = "DELETE  FROM loghistory WHERE level = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, level);
            ptm.executeUpdate();


        }
    }
}
