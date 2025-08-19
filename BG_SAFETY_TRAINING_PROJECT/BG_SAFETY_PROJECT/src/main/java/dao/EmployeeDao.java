package dao;

import model.Employee;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

    public boolean addEmployee(Employee emp) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO employees (name, department, email, status) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, emp.getName());
            stmt.setString(2, emp.getDepartment());
            stmt.setString(3, emp.getEmail());
            stmt.setString(4, emp.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM employees";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("department"),
                    rs.getString("email"),
                    rs.getString("status")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
