package com.bharatghumo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String username = request.getParameter("username");
      String password = request.getParameter("password");

      // 🔥 UPDATED DATABASE CONNECTION
      String jdbcURL = "jdbc:mysql://nozomi.proxy.rlwy.net:28631/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
      String dbUser = "root";
      String dbPassword = "zRUAPhpcEhbXkKCobyxCiMBptIziMnYo";

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
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("home.jsp");
         } else {
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