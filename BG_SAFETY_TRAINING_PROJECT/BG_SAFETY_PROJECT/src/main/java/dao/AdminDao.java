package dao;

import util.DBConnection;
import java.sql.*;

public class AdminDao {

    public int getCountByStatus(String status) {
        int count = 0;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM employees WHERE status = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getTrainedCount() {
        return getCountByStatus("trained");
    }

    public int getUntrainedCount() {
        return getCountByStatus("untrained");
    }

    public int getInTrainingCount() {
        return getCountByStatus("in_training");
    }
}
