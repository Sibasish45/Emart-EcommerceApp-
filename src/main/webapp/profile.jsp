<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ff9966, #ff5e62);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-card {
            background: #fff;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
            text-align: center;
            width: 350px;
        }
        .profile-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        .profile-card h2 {
            margin: 10px 0;
            color: #333;
        }
        .profile-card p {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            background: #ff5e62;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #ff2e38;
        }
    </style>
</head>
<body>
    <div class="profile-card">
        <img src="https://i.pravatar.cc/150?u=<%= session.getAttribute("email") %>" alt="Avatar">
        
        <h2>
            <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Guest" %>
        </h2>
        
        <p>Email: <%= session.getAttribute("email") != null ? session.getAttribute("email") : "Not available" %></p>
        
        <a href="products.jsp" class="btn">Back to Shop</a>
        <a href="logout.jsp" class="btn">Logout</a>
    </div>
</body>
</html>
