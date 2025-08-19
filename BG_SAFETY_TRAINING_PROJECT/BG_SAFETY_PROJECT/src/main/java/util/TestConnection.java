package util;

import java.sql.Connection;

public class TestConnection {
	 public static void main(String[] args) {
	        try {
	            Connection conn = DBConnection.getConnection();
	            if (conn != null) {
	                System.out.println("✅ Database connection successful!");
	                conn.close();  // always close when done
	            } else {
	                System.out.println("❌ Failed to connect to database.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}



//import java.sql.Connection;
//
//public class TestConnection {
//    public static void main(String[] args) {
//        try {
//            Connection conn = DBConnection.getConnection();
//            if (conn != null) {
//                System.out.println("✅ Database connection successful!");
//                conn.close();  // always close when done
//            } else {
//                System.out.println("❌ Failed to connect to database.");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}
