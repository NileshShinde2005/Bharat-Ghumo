<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("name");
        String comment = request.getParameter("comment");
        int stars = Integer.parseInt(request.getParameter("stars"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BharatGhumo", "root", "Nidi0204");
            PreparedStatement pst = conn.prepareStatement("INSERT INTO reviews(name, comment, stars) VALUES(?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, comment);
            pst.setInt(3, stars);
            pst.executeUpdate();
            conn.close();
            response.sendRedirect("mangalore.jsp");
        } catch(Exception e) {
            out.println("Error: " + e);
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Write a Review - Bharat Ghumo</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            background: linear-gradient(to bottom, #ff9933 0%, #ffffff 40%, #138808 80%);
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 90%;
            max-width: 600px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            color: #1976d2;
            margin-bottom: 20px;
        }

        input, textarea, select {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        button {
            background-color: #1976d2;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0d47a1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Write a Review</h2>
        <form method="post">
            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Comment:</label>
            <textarea name="comment" rows="5" required></textarea>

            <label>Rating:</label>
            <select name="stars">
                <option value="5">★★★★★</option>
                <option value="4">★★★★☆</option>
                <option value="3">★★★☆☆</option>
                <option value="2">★★☆☆☆</option>
                <option value="1">★☆☆☆☆</option>
            </select>

            <button type="submit">Submit Review</button>
        </form>
    </div>
</body>
</html>
