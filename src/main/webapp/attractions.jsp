<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Attractions - Mangalore Bharat Ghumo</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background: linear-gradient(to bottom, #ff9933 0%, #ffffff 33%, #138808 100%);
            min-height: 100vh;
            padding-top: 100px;
            padding-bottom: 100px;
        }

        header {
            background-color: rgba(11, 42, 74, 0.85);
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
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
            max-width: 1100px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .section {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .card {
            background-color: white;
            width: 280px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s;
            display: flex;
            flex-direction: column;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            height: 140px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card-content h3 {
            margin-top: 0;
            color: #004d66;
        }

        .card-content p {
            margin: 5px 0;
            font-size: 14px;
        }

        .scan-section {
            text-align: center;
            margin-top: 50px;
        }

        .scan-section p {
            font-size: 18px;
            color: #ff9933;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .scan-section img {
            width: 60px;
            cursor: pointer;
        }

        #qr-reader {
            width: 300px;
            margin: 20px auto;
            display: none;
            border: 2px solid #ff9933;
            border-radius: 10px;
            padding: 10px;
            background: #fff;
        }

        footer {
            background-color: rgba(11, 42, 74, 0.85);
            color: white;
            text-align: center;
            padding: 15px 0;
            border-top: 4px solid #ff9933;
            position: fixed;
            bottom: 0;
            width: 100%;
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
    <h1>Top Attractions in Mangalore</h1>

    <div class="section">
        <div class="card">
            <img src="assets/images/kadri_temple.jpg" alt="Kadri Manjunath Temple">
            <div class="card-content">
                <h3>Kadri Manjunath Temple</h3>
                <p><strong>Location:</strong> Kadri Hills</p>
                <p>Ancient 10th-century temple dedicated to Lord Shiva. Known for its bronze idols and peaceful surroundings.</p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/panambur_beach.jpg" alt="Panambur Beach">
            <div class="card-content">
                <h3>Panambur Beach</h3>
                <p><strong>Location:</strong> NH-66, Near New Mangalore Port</p>
                <p>Popular beach for sunset views, water sports, and annual kite festivals. Lifeguards and food stalls available.</p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/st_aloysius.jpg" alt="St. Aloysius Chapel">
            <div class="card-content">
                <h3>St. Aloysius Chapel</h3>
                <p><strong>Location:</strong> Lighthouse Hill Road</p>
                <p>Famous for its breathtaking frescoes painted by Italian artist Antonio Moscheni in the 19th century.</p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/pilikula.jpg" alt="Pilikula Nisargadhama">
            <div class="card-content">
                <h3>Pilikula Nisargadhama</h3>
                <p><strong>Location:</strong> Vamanjoor</p>
                <p>Eco-tourism park with zoo, science center, lake boating, heritage village, and botanical garden.</p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/tannirbhavi.jpg" alt="Tannirbhavi Beach">
            <div class="card-content">
                <h3>Tannirbhavi Beach</h3>
                <p><strong>Location:</strong> Bengre</p>
                <p>Scenic, less-crowded beach perfect for relaxation. Accessible by road or ferry. Basic amenities available.</p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/kudroli.jpg" alt="Kudroli Gokarnanath Temple">
            <div class="card-content">
                <h3>Kudroli Gokarnanath Temple</h3>
                <p><strong>Location:</strong> Kudroli, Mangalore</p>
                <p>Dedicated to Lord Shiva, famous for grand Dasara celebrations and golden chariots.</p>
            </div>
        </div>
    </div>

    <div class="scan-section">
        <p>Need more information? Scan</p>
        <img src="assets/images/camera-icon.png" alt="Scan QR" onclick="openQRScanner()">
        <div id="qr-reader"></div>
    </div>
</div>

<footer>
    <p>&copy; 2025 Bharat Ghumo. All rights reserved.</p>
</footer>

<!-- Load QR Code Scanner Library -->
<script src="https://unpkg.com/html5-qrcode"></script>
<script>
    function openQRScanner() {
        const scanRegion = document.getElementById("qr-reader");
        scanRegion.style.display = "block";

        const html5QrCode = new Html5Qrcode("qr-reader");
        Html5Qrcode.getCameras().then(devices => {
            if (devices && devices.length) {
                html5QrCode.start(
                    devices[0].id,
                    {
                        fps: 10,
                        qrbox: 250
                    },
                    qrCodeMessage => {
                        html5QrCode.stop().then(() => {
                        window.location.href = qrCodeMessage;
                        }).catch(err => {
                        console.error("Failed to stop scanner", err);
                        window.location.href = qrCodeMessage; // fallback
                        });
                        scanRegion.style.display = "none";
                    },
                    errorMessage => {
                        // scanning in progress
                    }
                ).catch(err => {
                    alert("Failed to start scanner: " + err);
                });
            }
        }).catch(err => {
            alert("No camera found or permission denied: " + err);
        });
    }
</script>

</body>
</html>
