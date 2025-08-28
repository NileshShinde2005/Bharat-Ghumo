<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Write Review - Mangalore</title>
</head>
<body>
    <h2>Write Your Review</h2>
    <form action="writeReview.jsp" method="post">
        <label>Your Name:</label><br>
        <input type="text" name="name" required><br><br>
        <label>Rating (1 to 5):</label><br>
        <input type="number" name="rating" min="1" max="5" required><br><br>
        <label>Comment:</label><br>
        <textarea name="comment" rows="5" cols="40" required></textarea><br><br>
        <button type="submit">Submit Review</button>
    </form>
</body>
</html>
