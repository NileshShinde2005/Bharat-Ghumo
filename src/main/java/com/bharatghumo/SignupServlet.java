package com.bharatghumo;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String jdbcURL = "jdbc:mysql://localhost:3306/bharatghumo";
        String dbUser = "root";
        String dbPassword = "Nidi0204";

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
                // Username or email already taken
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
