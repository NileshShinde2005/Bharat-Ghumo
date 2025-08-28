<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hotels - Mangalore Bharat Ghumo</title>
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
            padding-bottom: 60px;
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
            max-width: 1100px;
            margin: auto;
            padding: 30px;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }

        .tabs {
            text-align: center;
            margin-bottom: 20px;
        }

        .tabs button {
            padding: 10px 20px;
            margin: 5px;
            font-size: 16px;
            border: none;
            background-color: #ddd;
            cursor: pointer;
            border-radius: 5px;
        }

        .tabs button.active {
            background-color: #ff9933;
            color: white;
        }

        .filters {
            text-align: center;
            margin-bottom: 20px;
        }

        .filters select {
            padding: 8px 12px;
            margin: 0 10px;
            border-radius: 4px;
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
    <script>
        function showSection(section) {
            const isLodging = section === 'lodging';
            document.getElementById('lodging').style.display = isLodging ? 'flex' : 'none';
            document.getElementById('dining').style.display = isLodging ? 'none' : 'flex';
            document.getElementById('btn-lodging').classList.toggle('active', isLodging);
            document.getElementById('btn-dining').classList.toggle('active', !isLodging);
            document.getElementById('lodging-filters').style.display = isLodging ? 'block' : 'none';
         }


        function filterHotels() {
            let priceFilter = document.getElementById("priceFilter").value;
            let bedsFilter = document.getElementById("bedsFilter").value;

            document.querySelectorAll(".hotel-card").forEach(card => {
                let price = parseInt(card.getAttribute("data-price"));
                let beds = card.getAttribute("data-beds");

                let priceOk = (
                    priceFilter === "All" ||
                    (priceFilter === "Below ₹1000" && price < 1000) ||
                    (priceFilter === "₹1000 - ₹3000" && price >= 1000 && price <= 3000) ||
                    (priceFilter === "Above ₹3000" && price > 3000)
                );

                let bedOk = (bedsFilter === "All" || beds === bedsFilter);

                card.style.display = (priceOk && bedOk) ? "flex" : "none";
            });
        }

        window.onload = function () {
            showSection('lodging');
            document.getElementById("priceFilter").addEventListener("change", filterHotels);
            document.getElementById("bedsFilter").addEventListener("change", filterHotels);
        };
    </script>
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
    <h1>Mangalore' Hotels</h1>
    <div class="tabs">
        <button id="btn-lodging" onclick="showSection('lodging')">Lodging</button>
        <button id="btn-dining" onclick="showSection('dining')">Dining</button>
    </div>
    <div id="lodging-filters" class="filters">
        <label for="priceFilter">Price:</label>
        <select id="priceFilter">
            <option>All</option>
            <option>Below ₹1000</option>
            <option>₹1000 - ₹3000</option>
            <option>Above ₹3000</option>
        </select>
        <label for="bedsFilter">Beds:</label>
        <select id="bedsFilter">
            <option>All</option>
            <option>Single</option>
            <option>Double</option>
            <option>Family</option>
        </select>
    </div>
        <!-- Lodging Section -->
    <div id="lodging" class="section">
        <div class="card hotel-card" data-price="3383" data-beds="Double">
            <img src="assets/images/deepa_comforts.jpg" alt="Hotel Deepa Comforts">
            <div class="card-content">
                <h3>Hotel Deepa Comforts</h3>
                <p><strong>Location:</strong> MG Road, Near PVS Circle</p>
                <p><strong>Price:</strong> ₹3,383 / night</p>
                <p><strong>Beds:</strong> Double</p>
                <p><strong>Rating:</strong> ⭐ 4.1/5</p>
                <p><a href="https://www.google.com/maps/search/Hotel+Deepa+Comforts+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card hotel-card" data-price="1314" data-beds="Single">
            <img src="assets/images/poonja_international.jpg" alt="Hotel Poonja International">
            <div class="card-content">
                <h3>Hotel Poonja International</h3>
                <p><strong>Location:</strong> K.S. Rao Road, Hampankatta</p>
                <p><strong>Price:</strong> ₹1,314 / night</p>
                <p><strong>Beds:</strong> Single</p>
                <p><strong>Rating:</strong> ⭐ 3.4/5</p>
                <p><a href="https://www.google.com/maps/search/Hotel+Poonja+International+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card hotel-card" data-price="4500" data-beds="Double">
            <img src="assets/images/ocean_pearl.jpg" alt="The Ocean Pearl">
            <div class="card-content">
                <h3>The Ocean Pearl</h3>
                <p><strong>Location:</strong> Navabharath Circle, Kodialbail</p>
                <p><strong>Price:</strong> ₹4,500 / night</p>
                <p><strong>Beds:</strong> Double</p>
                <p><strong>Rating:</strong> ⭐ 4.5/5</p>
                <p><a href="https://www.google.com/maps/search/The+Ocean+Pearl+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card hotel-card" data-price="2200" data-beds="Double">
            <img src="assets/images/ginger_hotel.jpg" alt="Ginger Hotel Mangalore">
            <div class="card-content">
                <h3>Ginger Hotel Mangalore</h3>
                <p><strong>Location:</strong> Kottara Chowki Junction</p>
                <p><strong>Price:</strong> ₹2,200 / night</p>
                <p><strong>Beds:</strong> Double</p>
                <p><strong>Rating:</strong> ⭐ 4.0/5</p>
                <p><a href="https://www.google.com/maps/search/Ginger+Hotel+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card hotel-card" data-price="2800" data-beds="Family">
            <img src="assets/images/moti_mahal.jpg" alt="Hotel Moti Mahal">
            <div class="card-content">
                <h3>Hotel Moti Mahal</h3>
                <p><strong>Location:</strong> Falnir Road</p>
                <p><strong>Price:</strong> ₹2,800 / night</p>
                <p><strong>Beds:</strong> Family</p>
                <p><strong>Rating:</strong> ⭐ 4.2/5</p>
                <p><a href="https://www.google.com/maps/search/Hotel+Moti+Mahal+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card hotel-card" data-price="2500" data-beds="Double">
            <img src="assets/images/prestige.jpg" alt="Hotel Prestige">
            <div class="card-content">
                <h3>Hotel Prestige</h3>
                <p><strong>Location:</strong> K.S. Rao Road</p>
                <p><strong>Price:</strong> ₹2,500 / night</p>
                <p><strong>Beds:</strong> Double</p>
                <p><strong>Rating:</strong> ⭐ 4.0/5</p>
                <p><a href="https://www.google.com/maps/search/Hotel+Prestige+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>
    </div>

    <!-- Dining Section -->
    <div id="dining" class="section" style="display:none;">
        <div class="card">
            <img src="assets/images/giri_manjas.jpg" alt="Giri Manja’s">
            <div class="card-content">
                <h3>Giri Manja’s</h3>
                <p><strong>Location:</strong> Car Street</p>
                <p><strong>Cuisine:</strong> Seafood</p>
                <p><strong>Rating:</strong> ⭐ 4.6/5</p>
                <p><a href="https://www.google.com/maps/search/Giri+Manja's+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/sagar_ratna.jpg" alt="Sagar Ratna">
            <div class="card-content">
                <h3>Sagar Ratna</h3>
                <p><strong>Location:</strong> Ocean Pearl Hotel</p>
                <p><strong>Cuisine:</strong> South Indian, North Indian</p>
                <p><strong>Rating:</strong> ⭐ 4.2/5</p>
                <p><a href="https://www.google.com/maps/search/Sagar+Ratna+Ocean+Pearl+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/pallkhi.jpg" alt="Pallkhi Restaurant">
            <div class="card-content">
                <h3>Pallkhi Restaurant</h3>
                <p><strong>Location:</strong> Balmatta Road</p>
                <p><strong>Cuisine:</strong> Indian, Chinese</p>
                <p><strong>Rating:</strong> ⭐ 4.3/5</p>
                <p><a href="https://www.google.com/maps/search/Pallkhi+Restaurant+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/ideal_ice_cream.jpg" alt="Ideal Ice Cream Parlour">
            <div class="card-content">
                <h3>Ideal Ice Cream Parlour</h3>
                <p><strong>Location:</strong> Hampankatta</p>
                <p><strong>Cuisine:</strong> Desserts, Ice Cream</p>
                <p><strong>Rating:</strong> ⭐ 4.5/5</p>
                <p><a href="https://www.google.com/maps/search/Ideal+Ice+Cream+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/kudla.jpg" alt="Kudla Restaurant">
            <div class="card-content">
                <h3>Kudla Restaurant</h3>
                <p><strong>Location:</strong> Goldfinch Hotel</p>
                <p><strong>Cuisine:</strong> Mangalorean, Seafood</p>
                <p><strong>Rating:</strong> ⭐ 4.4/5</p>
                <p><a href="https://www.google.com/maps/search/Kudla+Restaurant+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/shezan.jpg" alt="Shezan Restaurant">
            <div class="card-content">
                <h3>Shezan Restaurant</h3>
                <p><strong>Location:</strong> Light House Hill Road</p>
                <p><strong>Cuisine:</strong> Arabic, Mughlai</p>
                <p><strong>Rating:</strong> ⭐ 4.0/5</p>
                <p><a href="https://www.google.com/maps/search/Shezan+Restaurant+Mangalore" target="_blank">View on Maps</a></p>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2025 Bharat Ghumo. All rights reserved.</p>
</footer>

</body>
</html>
