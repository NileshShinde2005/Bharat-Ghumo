<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.io.*" %>
<%
    List<String[]> reviews = new ArrayList<>();
    double totalRating = 0;
    int count = 0;

    try {
        InputStream input = application.getResourceAsStream("/WEB-INF/classes/database.properties");
        if (input == null) {
            throw new FileNotFoundException("database.properties not found in WEB-INF/classes");
        }

        Properties props = new Properties();
        props.load(input);

        String dbDriver = props.getProperty("db.driver");
        String dbURL = props.getProperty("db.url");
        String dbUser = props.getProperty("db.username");  // ✅ FIXED
        String dbPass = props.getProperty("db.password");  // ✅ FIXED

        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM reviews ORDER BY date DESC");

        while(rs.next()) {
            if (reviews.size() < 3) {
                reviews.add(new String[] {
                    rs.getString("name"),
                    rs.getString("comment"),
                    rs.getString("stars")
                });
            }
            totalRating += rs.getInt("stars");
            count++;
        }
        con.close();
    } catch(Exception e) {
        out.println("DB Connection Error: " + e.getMessage());
    }

    double avgRating = count > 0 ? (totalRating / count) : 0;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Mangalore - Bharat Ghumo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
        }

        .top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            padding: 10px 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .nav-left {
            display: flex;
            align-items: center;
        }

        .nav-left img {
            margin-right: 10px;
        }

        .brand-text {
            font-weight: bold;
            font-size: 20px;
            margin-right: 5px;
            color: #f57c00;
        }

        .tagline {
            font-size: 12px;
            color: #888;
        }

        .nav-center a {
            margin: 0 12px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
        }

        .nav-center a:hover {
            color: #1e88e5;
        }

        .nav-right a {
            margin-left: 12px;
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-outline {
            border: 1px solid #1e88e5;
            color: #1e88e5;
        }

        .btn-outline:hover {
            background-color: #e3f2fd;
        }

        .btn-orange {
            background-color: #ff9800;
            color: white;
            border: none;
        }

        .btn-orange:hover {
            background-color: #fb8c00;
        }

        .banner {
            background: url('<%= request.getContextPath() %>/assets/images/mangalore-banner.jpg') no-repeat center center/cover;
            height: 300px;
            color: white;
            position: relative;
        }

        .banner::after {
            content: "";
            background: rgba(0,0,0,0.5);
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
        }

        .banner-content {
            position: relative;
            z-index: 1;
            padding: 60px 40px;
        }

        .banner-content h1 {
            font-size: 48px;
            margin: 0;
        }

        .banner-content p {
            font-size: 20px;
            margin-top: 8px;
        }

        .container {
            padding: 30px 50px;
            max-width: 1200px;
            margin: auto;
        }

        .section {
            background: #fff;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        .section h2 {
            margin-top: 0;
        }

        .info-boxes {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 10px;
        }

        .info-box {
            flex: 1;
            min-width: 220px;
            background: #f1f1f1;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 15px;
        }

        .quick-info ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .quick-info li {
            padding: 6px 0;
        }

        .btn-danger {
            background-color: #e53935;
            color: white;
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 6px;
            display: inline-block;
            margin-top: 12px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }

        .section-header a {
            text-decoration: none;
            color: #1e88e5;
            font-size: 15px;
        }

        .horizontal-cards {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        .horizontal-card {
            flex: 1;
            min-width: 250px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            overflow: hidden;
            text-align: center;
        }

        .horizontal-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .horizontal-card h3 {
            margin: 15px;
            font-size: 18px;
        }

        .horizontal-card a {
            display: inline-block;
            background-color: #ff9800;
            color: white;
            padding: 10px 16px;
            margin-bottom: 15px;
            text-decoration: none;
            border-radius: 5px;
        }

        .review {
            border-top: 1px solid #eee;
            padding: 15px 0;
        }

        .review h4 {
            margin: 0 0 6px;
        }

        .review p {
            margin: 0;
            font-size: 14px;
        }

        .stars {
            color: #fbc02d;
        }

        .review-btn {
            display: inline-block;
            margin-top: 15px;
            background-color: #1976d2;
            color: white;
            padding: 10px 16px;
            border-radius: 5px;
            text-decoration: none;
        }

        .language-form {
            text-align: right;
            margin-top: -30px;
            margin-bottom: 20px;
        }

        .language-form select,
        .language-form button {
            padding: 8px;
            margin-left: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .rating-box {
            background: #f3f3f3;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
            max-width: 300px;
        }

        .rating-box h3 {
            margin-top: 0;
        }

        .rating-bar {
            background: #ddd;
            height: 6px;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .rating-fill {
            background: #4caf50;
            height: 6px;
            border-radius: 4px;
        }

        @media (max-width: 768px) {
            .horizontal-cards {
                flex-direction: column;
            }

            .horizontal-card {
                width: 100%;
            }

            .container {
                padding: 20px;
            }

            .language-form {
                text-align: left;
                margin-top: 0;
            }

            .nav-center, .nav-right {
                display: none;
            }
        }
    </style>
</head>
<body>

<!-- ===== Top Navigation Bar ===== -->
<div class="top-nav">
    <div class="nav-left">
        <img src="<%= request.getContextPath() %>/assets/images/location-pin.png" alt="Bharat Ghumo" height="36">
        <span class="brand-text">भारत घूमो</span>
        <span class="tagline">भारत यात्रा</span>
    </div>
    <div class="nav-right">
        <a href="destinations.jsp">Destinations</a>
        <a href="about.jsp">About</a>
        <a href="contact.jsp">Contact</a>
        <a href="dashboard.jsp" class="btn-outline">👤 Dashboard</a>
        <a href="logout.jsp" class="btn-orange">⎋ Logout</a>
    </div>
</div>

<!-- Banner -->
<div class="banner">
    <div class="banner-content">
        <h1>Mangalore</h1>
        <p>Coastal Gateway of Karnataka</p>
    </div>
</div>

<div class="container">
    <!-- Language Selector -->
    <div class="language-form">
        <form>
            <label for="lang">Language:</label>
            <select id="lang" name="lang">
                <option>English</option>
                <option>Kannada</option>
                <option>Hindi</option>
            </select>
            <button type="button">Get Directions</button>
        </form>
    </div>

    <!-- About Section -->
    <div class="section">
        <h2>About Mangalore</h2>
        <p>Mangalore (Mangaluru) is a vibrant port city in Karnataka, known for its cultural blend, coastal cuisine, and serene beaches.</p>
        <div class="info-boxes">
            <div class="info-box">🗓️ <strong>Best Time to Visit:</strong> October to March</div>
            <div class="info-box">🗣️ <strong>Languages:</strong> Tulu, Kannada, Konkani</div>
            <div class="info-box">🍤 <strong>Famous For:</strong> Beaches, Temples, Seafood</div>
        </div>
    </div>

    <!-- Quick Info -->
    <div class="section quick-info">
        <h2>Quick Information</h2>
        <ul>
            <li><strong>Location:</strong> West coast of Karnataka, India</li>
            <li><strong>Area:</strong> 124.6 km²</li>
            <li><strong>Population:</strong> Approx. 6 lakh</li>
            <li><strong>Local Food:</strong> Neer dosa, Kori rotti, Seafood</li>
            <li><strong>Top Spots:</strong> Panambur Beach, Kadri Temple, St. Aloysius Chapel</li>
        </ul>
        <a class="btn-danger" href="#">🚨 Emergency Contacts</a>
    </div>

    <!-- Attractions, Hotels, Transportation -->
    <div class="section">
        <div class="horizontal-cards">
            <div class="horizontal-card">
                <img src="<%= request.getContextPath() %>/assets/images/attraction.jpg" alt="Attractions">
                <h3>Attractions</h3>
                <a href="attractions.jsp">View More</a>
            </div>
            <div class="horizontal-card">
                <img src="<%= request.getContextPath() %>/assets/images/hotel.jpg" alt="Hotels">
                <h3>Hotels</h3>
                <a href="hotel.jsp">View More</a>
            </div>
            <div class="horizontal-card">
                <img src="<%= request.getContextPath() %>/assets/images/transport.jpg" alt="Transportation">
                <h3>Transportation</h3>
                <a href="transport.jsp">View More</a>
            </div>
        </div>
    </div>

    <!-- Reviews Section with Overall Rating -->
    <!-- Reviews Section with Overall Rating -->
<div class="section">
    <h2>Reviews & Ratings</h2>
    <div style="display: flex; flex-wrap: wrap; gap: 20px;">
        <div style="flex: 2;">
            <%-- Show 2 static + 1 latest user review --%>
            <div class="review">
                <h4>Aarav Menon</h4>
                <p>"A beautiful blend of modern life and traditional culture!"</p>
                <div class="stars">★★★★★</div>
            </div>
            <div class="review">
                <h4>Priya Singh</h4>
                <p>"Loved the seafood and calm beaches."</p>
                <div class="stars">★★★★☆</div>
            </div>
            <% if (!reviews.isEmpty()) { %>
                <% String[] latest = reviews.get(0); %>
                <div class="review">
                    <h4><%= latest[0] %></h4>
                    <p><%= latest[1] %></p>
                    <div class="stars">
                        <% for (int i = 1; i <= 5; i++) {
                            if (i <= Integer.parseInt(latest[2])) { %>
                                ★
                        <%  } else { %>
                                ☆
                        <%  } } %>
                    </div>
                </div>
            <% } %>
        </div>

        <div class="rating-box">
            <h3>Overall Rating</h3>
            <div style="font-size: 32px; font-weight: bold; color: #1976d2;">
                <%= String.format("%.1f", avgRating) %>
            </div>
            <div style="color: #888; margin-bottom: 15px;">Based on <%= count %> reviews</div>

            <div><strong>Attractions</strong>
                <div class="rating-bar"><div class="rating-fill" style="width: 92%;"></div></div></div>
            <div><strong>Accommodation</strong>
                <div class="rating-bar"><div class="rating-fill" style="width: 86%;"></div></div></div>
            <div><strong>Food</strong>
                <div class="rating-bar"><div class="rating-fill" style="width: 94%;"></div></div></div>
            <div><strong>Transportation</strong>
                <div class="rating-bar"><div class="rating-fill" style="width: 80%;"></div></div></div>
            <div><strong>Value for Money</strong>
                <div class="rating-bar"><div class="rating-fill" style="width: 88%;"></div></div></div>
        </div>
    </div>
    <a class="review-btn" href="writeReview.jsp">Write a Review</a>
    <a class="review-btn" href="viewAllReviews.jsp">View All Reviews</a>
</div>

</div>

</body>
</html>
