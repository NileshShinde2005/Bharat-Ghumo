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
    <title>Welcome - Bharat Ghumo</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #ff9933 0%, #ffffff 50%, #138808 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .welcome-box {
            text-align: center;
            color: #0b2a4a;
        }

        .welcome-box h1 {
            font-size: 64px;
            margin-bottom: 20px;
            animation: fadeIn 2s ease-in-out;
        }

        .welcome-box p {
            font-size: 20px;
            color: #444;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
    <script>
        setTimeout(function () {
            window.location.href = "dashboard.jsp";
        }, 3000); // 3 seconds
    </script>
</head>
<body>

<div class="welcome-box">
    <h1>नमस्ते, <%= username %>!</h1>
    <p>Loading your travel dashboard...</p>
</div>

</body>
</html>
