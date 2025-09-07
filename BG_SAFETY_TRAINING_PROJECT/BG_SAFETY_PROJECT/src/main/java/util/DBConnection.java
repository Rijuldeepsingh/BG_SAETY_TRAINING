package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/bg_safety_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&autoReconnect=true&maxReconnects=3&initialTimeout=2";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    
    private static boolean driverLoaded = false;
    
    static {
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            driverLoaded = true;
            System.out.println("MySQL JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL Driver not found: " + e.getMessage());
            driverLoaded = false;
        }
    }
    
    public static Connection getConnection() throws SQLException {
        if (!driverLoaded) {
            throw new SQLException("MySQL JDBC Driver not loaded");
        }
        
        try {
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            // Configure connection for persistence
            connection.setAutoCommit(true);
            
            // Test connection
            if (!connection.isValid(5)) {
                connection.close();
                throw new SQLException("Connection validation failed");
            }
            
            return connection;
            
        } catch (SQLException e) {
            System.err.println("Failed to create database connection: " + e.getMessage());
            throw e;
        }
    }
    
    public static void closeDataSource() {
        // For basic JDBC, we don't have a pool to close
        System.out.println("Using basic JDBC connections - no pool to close");
    }
    
    // Get connection status for monitoring
    public static String getPoolStatus() {
        return "Using basic JDBC connections (no pool)";
    }
    
    // Test connection method
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && conn.isValid(2);
        } catch (SQLException e) {
            System.err.println("Connection test failed: " + e.getMessage());
            return false;
        }
    }
}



