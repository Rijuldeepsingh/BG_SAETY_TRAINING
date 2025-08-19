package dao;

import model.EmployeeTraining;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeTrainingDao {

    public boolean assignTraining(EmployeeTraining et) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO employee_training (employee_id, training_id, status) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, et.getEmployeeId());
            stmt.setInt(2, et.getTrainingId());
            stmt.setString(3, et.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<EmployeeTraining> getAllAssignments() {
        List<EmployeeTraining> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM employee_training";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new EmployeeTraining(
                    rs.getInt("id"),
                    rs.getInt("employee_id"),
                    rs.getInt("training_id"),
                    rs.getString("status")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
