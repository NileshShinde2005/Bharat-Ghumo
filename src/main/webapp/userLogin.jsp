<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bharat Ghumo - User Login</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .login-container {
            max-width: 400px;
            margin: 60px auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            text-align: left;
        }

        .login-container h2 {
            font-size: 28px;
            font-weight: 600;
            color: #000;
            margin-bottom: 10px;
        }

        .login-container p {
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        button.login-btn {
            width: 100%;
            padding: 12px;
            background-color: #ff9800;
            color: #fff;
            border: none;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        .signup-link {
            margin-top: 20px;
            text-align: center;
        }

        .signup-link a {
            text-decoration: none;
            color: #000;
            font-weight: 500;
        }

        .terms {
            font-size: 12px;
            text-align: center;
            margin-top: 15px;
            color: #777;
        }

        .logo-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo-section img {
            width: 50px;
        }

        .logo-section h1 {
            font-size: 28px;
            color: #ff9800;
            margin: 10px 0 0;
        }

        .logo-section p {
            font-family: 'Noto Sans Devanagari', 'Mangal', sans-serif;
            font-size: 16px;
            color: #555;
        }

        .back-link {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 18px;
            text-decoration: none;
            color: #ff9800;
            font-weight: 600;
        }

        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<a href="index.jsp" class="back-link">&#8592; Back</a>

<div class="login-container">
    <div class="logo-section">
        <img src="assets/images/location-pin.png" alt="Location">
        <h1>Bharat Ghumo</h1>
        <p>आपका गाइड</p>
    </div>

    <h2>Welcome Back</h2>
    <p>Login to explore the beauty of Bharat</p>

    <%-- Show error if login failed --%>
    <% if (request.getParameter("error") != null) { %>
        <div class="error-message">Invalid username or password.</div>
    <% } %>

    <form action="login" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <div class="signup-link">
    <p>Don't have an account? <a href="userSignup.jsp">Sign Up</a><p>
    </div>


    <div class="terms">
        By continuing, you agree to our Terms of Service and Privacy Policy.
    </div>
</div>

</body>
</html>
