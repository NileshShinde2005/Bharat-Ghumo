package com.bharatghumo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 🔥 UPDATED DB CONNECTION (Railway)
        String jdbcURL = "jdbc:mysql://nozomi.proxy.rlwy.net:28631/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "zRUAPhpcEhbXkKCobyxCiMBptIziMnYo";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Check if username or email already exists
            String checkQuery = "SELECT * FROM users WHERE username = ? OR email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            checkStmt.setString(2, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("error", "Username or Email already registered.");
                request.getRequestDispatcher("userSignup.jsp").forward(request, response);
            } else {

                // Insert new user
                String insertQuery = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(insertQuery);
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, password);

                int rows = stmt.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect("userLogin.jsp?signup=success");
                } else {
                    request.setAttribute("error", "Something went wrong. Try again.");
                    request.getRequestDispatcher("userSignup.jsp").forward(request, response);
                }
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error. Please try later.");
            request.getRequestDispatcher("userSignup.jsp").forward(request, response);
        }
    }
}