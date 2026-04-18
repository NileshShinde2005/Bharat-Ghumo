<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = "Guest";
    if (session != null && session.getAttribute("username") != null) {
        username = (String) session.getAttribute("username");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Bharat Ghumo</title>
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

        nav a.dashboard-btn {
            border: 1px solid white;
        }

        nav a.logout-btn {
            background: #ff6600;
            color: white;
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

        .container {
            max-width: 900px;
            margin: 100px auto 40px auto;
            background-color: rgba(255, 255, 255, 0.98);
            padding: 60px 40px;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(0,0,0,0.2);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 90%;
            height: 90%;
            background: url('assets/images/india-illustration.png') no-repeat center center;
            background-size: contain;
            opacity: 0.18;
            filter: brightness(110%);
            z-index: 0;
            pointer-events: none;
        }

        .container > * {
            position: relative;
            z-index: 1;
        }

        h2 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
            color: #222;
        }

        .subtext {
            color: #555;
            font-size: 16px;
            margin-bottom: 30px;
        }

        .search-bar {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .search-bar input {
            width: 60%;
            max-width: 400px;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 10px 0 0 10px;
            outline: none;
        }

        .search-bar button {
            padding: 12px 20px;
            background-color: orange;
            color: white;
            border: none;
            border-radius: 0 10px 10px 0;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .search-bar button:hover {
            background-color: darkorange;
        }

        .explore-title {
            font-size: 24px;
            font-weight: bold;
            color: #222;
            margin: 30px 0 15px;
        }

        .explore-title span {
            color: orange;
        }

        .legend {
            font-size: 14px;
            margin-top: 30px;
            color: #444;
            line-height: 1.8;
        }

        .legend span {
            margin-right: 15px;
            display: inline-block;
        }

        .legend .available {
            color: orange;
        }

        .legend .coming {
            color: #888;
        }

        .legend a {
            color: #1e90ff;
            text-decoration: none;
            font-weight: 500;
        }

        .legend a:hover {
            text-decoration: underline;
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
        <a href="#">Home</a>
        <a href="#">Destinations</a>
        <a href="about.jsp">About</a>
        <a href="contact.jsp">Contact</a>
        <a href="dashboard.jsp" class="dashboard-btn">Dashboard</a>
        <a href="logout.jsp" class="logout-btn">Logout</a>
    </nav>
</header>

<div class="container">
    <h2>Welcome, <%= username %></h2>
    <p class="subtext">Explore the wonders of India with your personal travel guide</p>

    <div class="search-bar">
        <form onsubmit="return handleSearch(event)">
            <input type="text" id="searchInput" placeholder="Search destinations (try Mangalore)">
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="explore-title">Explore <span>India</span></div>

    <div class="legend">
        <span class="available">🟧 Available</span>
        <span class="coming">⬜ Coming Soon</span><br><br>
        Currently featuring Mangalore. More destinations coming soon!<br>
        <a href="mangalore.jsp">View Mangalore Guide →</a>
    </div>
</div>

<footer>
    <p>&copy; 2025 Bharat Ghumo. All rights reserved.</p>
</footer>

<!-- JavaScript for search handling -->
<script>
    function handleSearch(event) {
        event.preventDefault(); // Prevent form submission
        const input = document.getElementById("searchInput").value.trim().toLowerCase();

        if (input === "mangalore") {
            window.location.href = "mangalore.jsp";
        } else {
            alert("Information for '" + input + "' is coming soon! Stay tuned.");
        }

        return false;
    }
</script>

</body>
</html>
