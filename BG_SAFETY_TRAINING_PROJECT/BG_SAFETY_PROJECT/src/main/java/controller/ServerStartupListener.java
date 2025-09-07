package controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import util.DBConnection;

@WebListener
public class ServerStartupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("*********************************************");
        System.out.println("BG_SAFETY_PROJECT Application Started Up!");
        
        try {
            System.out.println("Database Connection Status: " + DBConnection.getPoolStatus());
            if (DBConnection.testConnection()) {
                System.out.println("Database connection test: SUCCESS");
            } else {
                System.out.println("Database connection test: FAILED");
            }
        } catch (Exception e) {
            System.err.println("Database initialization error: " + e.getMessage());
        }
        
        System.out.println("*********************************************");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("*********************************************");
        System.out.println("BG_SAFETY_PROJECT Application Shutting Down!");
        
        // Properly close the HikariCP connection pool
        try {
            DBConnection.closeDataSource();
            System.out.println("Database connection pool closed successfully");
        } catch (NoClassDefFoundError e) {
            System.out.println("DBConnection class not initialized - skipping pool closure");
        } catch (Exception e) {
            System.err.println("Error closing database connection pool: " + e.getMessage());
        }
        
        // Clean up MySQL threads to prevent memory leaks
        try {
            com.mysql.cj.jdbc.AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("MySQL cleanup thread shutdown successfully");
        } catch (Exception e) {
            System.err.println("Error shutting down MySQL cleanup thread: " + e.getMessage());
        }
        
        System.out.println("*********************************************");
    }
}