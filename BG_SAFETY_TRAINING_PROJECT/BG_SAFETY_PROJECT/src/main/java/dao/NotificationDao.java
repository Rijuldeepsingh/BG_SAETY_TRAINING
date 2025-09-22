//package dao;
//
//import model.Notification;
//import util.DBConnection;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.Timestamp;
//
//public class NotificationDao {
//
//    public boolean createNotification(Notification notification) {
//        try (Connection conn = DBConnection.getConnection()) {
//            String sql = "INSERT INTO notifications (user_id, message, is_read, created_at) VALUES (?, ?, ?, ?)";
//            PreparedStatement stmt = conn.prepareStatement(sql);
//            stmt.setInt(1, notification.getUserId());
//            stmt.setString(2, notification.getMessage());
//            stmt.setBoolean(3, notification.isRead());
//            stmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
//            return stmt.executeUpdate() > 0;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public java.util.List<Notification> getUnreadNotificationsByUserId(int userId) {
//        java.util.List<Notification> notifications = new java.util.ArrayList<>();
//        try (Connection conn = DBConnection.getConnection()) {
//            String sql = "SELECT * FROM notifications WHERE user_id = ? AND is_read = false ORDER BY created_at DESC";
//            PreparedStatement stmt = conn.prepareStatement(sql);
//            stmt.setInt(1, userId);
//            ResultSet rs = stmt.executeQuery();
//            while (rs.next()) {
//                notifications.add(new Notification(
//                    rs.getInt("id"),
//                    rs.getInt("user_id"),
//                    rs.getString("message"),
//                    rs.getBoolean("is_read"),
//                    rs.getTimestamp("created_at")
//                ));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return notifications;
//    }
//}
