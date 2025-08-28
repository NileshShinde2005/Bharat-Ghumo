<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transport - Mangalore Bharat Ghumo</title>
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
            border: 1px solid white;
        }

        nav a:hover {
            background-color: #ff9933;
        }

        .container {
            padding: 20px;
            max-width: 1000px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
        }

        h1, h2 {
            color: #2c3e50;
            text-align: center;
        }

        .section {
            margin-bottom: 40px;
        }

        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 20px;
            margin-top: 10px;
            display: flex;
            gap: 20px;
            align-items: flex-start;
        }

        .card img {
            width: 200px;
            height: 140px;
            object-fit: cover;
            border-radius: 10px;
        }

        .card-content {
            flex: 1;
        }

        a {
            color: #3498db;
            text-decoration: none;
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
        <a href="mangalore.jsp">← Back to Mangalore</a>
    </nav>
</header>

<div class="container">
    <h1> Transport in Mangalore</h1>

    <div class="section">
        <h2>Mangalore Junction Railway Station (MAJN)</h2>
        <div class="card">
            <img src="assets/images/mangalore_junction.jpg" alt="Mangalore Junction">
            <div class="card-content">
                <p><strong>Location:</strong> Kankanady, Mangalore, Karnataka – 575007</p>
                <p><strong>Station Code:</strong> MAJN</p>
                <p><strong>Zone:</strong> Southern Railway (SR)</p>
                <p><strong>Division:</strong> Palakkad</p>
                <p><strong>Key Facilities:</strong> Waiting rooms, retiring rooms, cloakroom, food court, ATMs, Wi-Fi</p>
                <p><strong>Popular Trains:</strong> Matsyagandha Express, Netravati Express, Marusagar Express, Kerala Sampark Kranti, Yeshvantpur Express</p>
                <p><strong>Google Maps:</strong> <a href="https://www.google.com/maps/place/Mangalore+Jn+Railway+Station/@12.873712,74.842065" target="_blank">View Location</a></p>
            </div>
        </div>
    </div>

    <div class="section">
        <h2>Mangalore Central Railway Station (MAQ)</h2>
        <div class="card">
            <img src="assets/images/mangalore_central.jpg" alt="Mangalore Central">
            <div class="card-content">
                <p><strong>Location:</strong> Hampankatta, Mangalore, Karnataka – 575001</p>
                <p><strong>Station Code:</strong> MAQ</p>
                <p><strong>Zone:</strong> Southern Railway (SR)</p>
                <p><strong>Division:</strong> Palakkad</p>
                <p><strong>Key Facilities:</strong> Booking counters, food stalls, waiting rooms, cloakroom, foot over bridge</p>
                <p><strong>Popular Trains:</strong> Mangalore–Chennai Express, West Coast Express, Malabar Express</p>
                <p><strong>Google Maps:</strong> <a href="https://www.google.com/maps/place/Mangalore+Central+Railway+Station/" target="_blank">View Location</a></p>
            </div>
        </div>
    </div>

    <div class="section">
        <h2>Mangalore International Airport (IXE)</h2>
        <div class="card">
            <img src="assets/images/mangalore_airport.jpg" alt="Mangalore Airport">
            <div class="card-content">
                <p><strong>Location:</strong> Bajpe, Mangalore, Karnataka – 574142</p>
                <p><strong>Airport Code:</strong> IXE</p>
                <p><strong>Facilities:</strong> International and domestic terminals, duty-free shops, lounges, currency exchange</p>
                <p><strong>Connectivity:</strong> Flights to Bangalore, Mumbai, Delhi, Dubai, Doha, Muscat</p>
                <p><strong>Google Maps:</strong> <a href="https://www.google.com/maps/place/Mangalore+International+Airport/" target="_blank">View Location</a></p>
            </div>
        </div>
    </div>

    <div class="section">
        <h2>KSRTC Bus Stand</h2>
        <div class="card">
            <img src="assets/images/ksrtc_bus_stand.jpg" alt="KSRTC Bus Stand">
            <div class="card-content">
                <p><strong>Location:</strong> Bejai, Mangalore, Karnataka – 575004</p>
                <p><strong>Services:</strong> Government-run long-distance buses to Bangalore, Mysore, Hubli, Goa, Kerala</p>
                <p><strong>Facilities:</strong> Waiting lounge, inquiry counter, ticket booking, restrooms, food stalls</p>
                <p><strong>Google Maps:</strong> <a href="https://www.google.com/maps/place/KSRTC+Bus+Stand,+Mangalore/" target="_blank">View Location</a></p>
            </div>
        </div>
    </div>

    <div class="section">
        <h2>Intra-City Travel Options</h2>
        <div class="card">
            <img src="assets/images/mangalore_city_travel.jpg" alt="Intra-City Travel">
            <div class="card-content">
                <p><strong>City Buses:</strong> Operated by DKRTC and private operators; connect major areas like Statebank, Lalbagh, Kankanady, Surathkal. Fares start from ₹10.</p>
                <p><strong>Auto Rickshaws:</strong> Available throughout the city. Minimum fare ~₹30. Best for short distances and quick commutes.</p>
                <p><strong>Ola & Uber:</strong> App-based cabs available widely in Mangalore for point-to-point and hourly rentals.</p>
                <p><strong>Rental Services:</strong> Cars and bikes available for rent via apps like Zoomcar, Bounce, Royal Brothers.</p>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2025 Bharat Ghumo. All rights reserved.</p>
</footer>

</body>
</html>
