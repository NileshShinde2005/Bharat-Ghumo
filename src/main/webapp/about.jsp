<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About - Bharat Ghumo</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background: linear-gradient(to bottom, #ff9933 0%, #ffffff 50%, #138808 100%);
            min-height: 100vh;
            padding-top: 100px;
            padding-bottom: 60px;
        }

        header {
            background-color: rgba(11, 42, 74, 0.85);
            color: white;
            padding: 20px 40px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 40px;
            margin-right: 10px;
        }

        .logo div {
            line-height: 1.2;
        }

        .logo strong {
            font-size: 20px;
            color: #ffcc00;
        }

        .logo small {
            color: #eee;
            font-size: 12px;
        }

        nav a {
            margin-left: 20px;
            text-decoration: none;
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 6px 10px;
            border-radius: 5px;
        }

        nav a:hover {
            background-color: #ff9933;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.98);
            padding: 60px 40px;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(0,0,0,0.2);
            text-align: center;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #333;
        }

        p {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .highlight {
            color: #ff6600;
            font-weight: bold;
        }

        .back-btn {
            display: inline-block;
            margin-top: 30px;
            background-color: #ff6600;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: darkorange;
        }

        footer {
            background-color: rgba(11, 42, 74, 0.85);
            color: white;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            border-top: 4px solid #ff9933;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
        <img src="assets/images/location-pin.png" alt="Bharat Ghumo">
        <div>
            <strong>Ghumo</strong><br>
            <small>आपका गाइड</small>
        </div>
    </div>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="contact.jsp">Contact</a>
        <a href="logout.jsp">Logout</a>
    </nav>
</header>

<div class="container">
    <h1>About Bharat Ghumo</h1>
    <p><span class="highlight">Bharat Ghumo</span> is a Java-based mini project designed to guide travelers across India, starting with a deep dive into Mangalore city.</p>
    <p>It includes user login, signup, dashboard navigation, hotel listings, transport options, and user reviews — all wrapped in a user-friendly interface built using <span class="highlight">JSP, Servlets, HTML/CSS, and MySQL</span>.</p>
    <p>The goal is to combine tech with tourism, helping people explore India with ease, convenience, and trust. New destinations will be added soon!</p>
    <p>This project demonstrates the practical application of core Java web technologies in building a real-world web portal.</p>

    <a class="back-btn" href="dashboard.jsp"">← Back to Home</a>
</div>

<footer>
    <p>&copy; 2025 Bharat Ghumo. All rights reserved.</p>
</footer>

</body>
</html>
