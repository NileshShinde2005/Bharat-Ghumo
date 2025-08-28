<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact - Bharat Ghumo</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            box-sizing: border-box;
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
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .back-arrow {
            margin-right: 20px;
            text-decoration: none;
            color: white;
            font-size: 22px;
            font-weight: bold;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 50px 40px;
            border-radius: 15px;
            box-shadow: 0 0 25px rgba(0,0,0,0.2);
            text-align: center;
        }

        h2 {
            font-size: 32px;
            margin-bottom: 10px;
            color: #222;
        }

        p {
            color: #555;
            margin-bottom: 30px;
            font-size: 16px;
        }

        .contact-icons {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .contact-icons a {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
            color: #333;
            transition: transform 0.3s ease;
        }

        .contact-icons a:hover {
            transform: scale(1.1);
        }

        .contact-icons img {
            width: 60px;
            height: 60px;
            margin-bottom: 8px;
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
    <a href="dashboard.jsp" class="back-arrow">&#8592; Back</a>
    <h2>Contact Us</h2>
</header>

<div class="container">
    <p><strong>Address:</strong> Available soon</p>

    <div class="contact-icons">
        <a href="https://www.instagram.com/bharat_ghumo.31?utm_source=qr&igsh=MTVrbzQ4OTY4dzg1aQ==" target="_blank">
            <img src="assets/images/instagram.png" alt="Instagram">
            Instagram
        </a>
        <a href="https://x.com/Bharatghumo31?t=-rXR0dRDQXe25Zozb1QJOA&s=08" target="_blank">
            <img src="assets/images/twitter.png" alt="Twitter">
            Twitter
        </a>
        <a href="https://www.facebook.com/share/1519Y2ugzp/" target="_blank">
            <img src="assets/images/facebook.png" alt="Facebook">
            Facebook
        </a>
        <a href="mailto:bharatghumo20354@gmail.com">
            <img src="assets/images/email-icon.png" alt="Email">
            Email
        </a>
    </div>
</div>

<footer>
    <p>&copy; 2025 Bharat Ghumo. All rights reserved.</p>
</footer>

</body>
</html>
