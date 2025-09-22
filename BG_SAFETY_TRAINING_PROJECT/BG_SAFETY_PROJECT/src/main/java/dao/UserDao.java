package dao;

import model.User;
import util.DBConnection;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;

public class UserDao {

    public User login(String username, String password) {
        User user = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");

                // --- TEMPORARY AND INSECURE --- 
                // This block is to handle plain text passwords stored in the database.
                // It is a security risk and should be removed after migrating all passwords to bcrypt.
                boolean passwordMatch = false;
                try {
                    passwordMatch = BCrypt.checkpw(password, hashedPassword);
                } catch (IllegalArgumentException e) {
                    // Fallback to plain text comparison if bcrypt fails
                    passwordMatch = password.equals(hashedPassword);
                }

                if (passwordMatch) {
                    user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        hashedPassword, // Storing the potentially plain text password in the user object
                        rs.getString("role")
                    );
                }
                // --- END OF TEMPORARY FIX ---
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public String hashPassword(String plainTextPassword){
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }
}
