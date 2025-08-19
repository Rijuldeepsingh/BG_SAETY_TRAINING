package dao;

import model.Training;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainingDao {

    public boolean addTraining(Training training) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO trainings (title, description) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, training.getTitle());
            stmt.setString(2, training.getDescription());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Training> getAllTrainings() {
        List<Training> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM trainings";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new Training(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("description")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

