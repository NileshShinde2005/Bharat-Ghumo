package com.bharatghumo;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class TestDBConnection {
    public static void main(String[] args) {
        Properties properties = new Properties();
        try {
            // Load database.properties file
            FileInputStream fis = new FileInputStream("src/main/resources/database.properties");
            properties.load(fis);

            // Retrieve database details
            String url = properties.getProperty("db.url");
            String user = properties.getProperty("db.username");
            String password = properties.getProperty("db.password");
            String driver = properties.getProperty("db.driver");

            // Load MySQL JDBC Driver
            Class.forName(driver);

            // Connect to Database
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("✅ Database Connected Successfully!");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
