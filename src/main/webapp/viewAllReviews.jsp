<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*,java.io.*" %>
<%
    List<String[]> allReviews = new ArrayList<>();

    try {
        InputStream input = application.getResourceAsStream("/WEB-INF/classes/database.properties");
        Properties props = new Properties();
        props.load(input);

        String dbDriver = props.getProperty("db.driver");
        String dbURL = props.getProperty("db.url");
        String dbUser = props.getProperty("db.username");
        String dbPass = props.getProperty("db.password");

        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM reviews ORDER BY date DESC");

        while(rs.next()) {
            allReviews.add(new String[] {
                rs.getString("name"),
                rs.getString("comment"),
                rs.getString("stars")
            });
        }
        con.close();
    } catch(Exception e) {
        out.println("Error loading reviews: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Reviews - Bharat Ghumo</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #ff9933 0%, #ffffff 40%, #138808 80%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 90%;
            max-width: 700px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            color: #1976d2;
            margin-bottom: 20px;
            text-align: center;
        }

        .review {
            border-top: 1px solid #ddd;
            padding: 15px 0;
        }

        .review h4 {
            margin: 0;
            font-weight: bold;
        }

        .review p {
            margin: 6px 0 8px;
        }

        .stars {
            color: #fbc02d;
            font-size: 18px;
        }

        a.back {
            display: block;
            margin-top: 30px;
            text-align: center;
            text-decoration: none;
            color: #1976d2;
            font-weight: bold;
        }

        a.back:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>All Reviews for Mangalore</h2>
        <% if (allReviews.isEmpty()) { %>
            <p>No reviews available yet.</p>
        <% } else { %>
            <% for(String[] rev : allReviews) { %>
                <div class="review">
                    <h4><%= rev[0] %></h4>
                    <p><%= rev[1] %></p>
                    <div class="stars">
                        <% for (int i = 1; i <= 5; i++) {
                            if (i <= Integer.parseInt(rev[2])) { %>★<% } else { %>☆<% } } %>
                    </div>
                </div>
            <% } %>
        <% } %>
        <a class="back" href="mangalore.jsp">← Back to Mangalore</a>
    </div>
</body>
</html>
