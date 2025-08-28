package com.bharatghumo;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String jdbcURL = "jdbc:mysql://localhost:3306/BharatGhumo";
        String dbUser = "root";
        String dbPassword = "Nidi0204"; // Replace with your actual password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM users WHERE username = ? AND password = ?"
            );
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // ✅ Store username in session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // ✅ Redirect to home.jsp instead of dashboard.jsp
                response.sendRedirect("home.jsp");
            } else {
                // ❌ Invalid login
                response.sendRedirect("userLogin.jsp?error=1");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red;'>Login error occurred:</h3>");
            out.println("<pre>" + e.toString() + "</pre>");
        }
    }
}
