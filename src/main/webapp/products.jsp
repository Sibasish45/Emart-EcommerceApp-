<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<html>
<head>
    <title>Products</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }
        
        h2 {
            text-align: center;
            color: #2c3e50;
            margin: 120px 0 30px 0;
            font-size: 32px;
            font-weight: 300;
        }
        
        /* Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background: #fff;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        
        .search-bar { 
            flex: 1; 
            display: flex; 
            justify-content: center; 
        }
        
        .search-bar input {
            width: 60%; 
            max-width: 400px;
            padding: 10px 15px; 
            border: 1px solid #ddd;
            border-radius: 4px; 
            outline: none; 
            font-size: 14px;
            transition: border 0.3s;
        }
        
        .search-bar input:focus {
            border-color: #3498db;
        }
        
        .header .cart-btn {
            background: #3498db; 
            color: white;
            padding: 10px 20px; 
            border-radius: 4px;
            text-decoration: none; 
            margin-right: 20px;
            transition: background 0.3s;
        }
        
        .header .cart-btn:hover { 
            background: #2980b9; 
        }
        
        /* Category filter */
        .category-filter { 
            text-align: center; 
            margin-bottom: 30px;
            padding: 0 20px;
        }
        
        .category-filter button {
            background: #fff; 
            border: 1px solid #ddd;
            padding: 8px 20px;
            margin: 0 5px;
            border-radius: 4px; 
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        .category-filter button:hover { 
            background: #3498db; 
            color: white;
            border-color: #3498db;
        }
        
        /* Products */
        .product-grid {
            display: grid; 
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px; 
            padding: 0 20px 60px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .product-card {
            background: #fff; 
            border-radius: 8px; 
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            transition: all 0.3s;
            display: flex;
            flex-direction: column;
        }
        
        .product-card:hover { 
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .product-card img {
            width: 100%; 
            height: 200px; 
            object-fit: cover;
            border-radius: 6px; 
            margin-bottom: 15px;
        }
        
        .product-card h3 { 
            color: #2c3e50; 
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: 500;
        }
        
        .product-card p { 
            color: #7f8c8d; 
            font-size: 14px; 
            margin-bottom: 15px;
            flex-grow: 1;
        }
        
        .price { 
            font-size: 18px; 
            font-weight: 600; 
            color: #e74c3c; 
            margin-bottom: 20px;
        }
        
        .btn-container {
            display: flex;
            justify-content: space-between;
        }
        
        .btn {
            display: inline-block; 
            padding: 10px 15px;
            background: #3498db; 
            color: white;
            border-radius: 4px; 
            text-decoration: none;
            transition: background 0.3s;
            font-weight: 500;
            text-align: center;
            flex: 1;
            margin: 0 5px;
        }
        
        .btn:hover { 
            background: #2980b9; 
        }
        
        .btn.secondary {
            background: #ecf0f1;
            color: #2c3e50;
        }
        
        .btn.secondary:hover {
            background: #bdc3c7;
        }
        
        /* Profile bottom right */
        .profile-container { 
            position: fixed; 
            bottom: 20px; 
            right: 20px; 
        }
        
        .profile {
            display: flex; 
            align-items: center; 
            background: #fff;
            padding: 10px 15px; 
            border-radius: 30px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1); 
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .profile:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
        }
        
        .profile img { 
            width: 36px; 
            height: 36px; 
            border-radius: 50%; 
            margin-right: 10px; 
        }
        
        .profile span { 
            font-weight: 500; 
            color: #2c3e50;
            font-size: 14px;
        }
        
        .dropdown {
            display: none; 
            position: absolute; 
            bottom: 70px; 
            right: 0;
            background: #fff; 
            border-radius: 6px; 
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            min-width: 160px;
        }
        
        .dropdown a {
            display: block; 
            padding: 12px 15px; 
            text-decoration: none; 
            color: #2c3e50;
            transition: background 0.3s;
        }
        
        .dropdown a:hover { 
            background: #f8f9fa; 
        }
        
        .dropdown a:first-child {
            border-radius: 6px 6px 0 0;
        }
        
        .dropdown a:last-child {
            border-radius: 0 0 6px 6px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search products...">
        </div>
        <a href="cart.jsp" class="cart-btn">🛒 Cart</a>
    </div>

    <h2>Our Products</h2>

    <!-- Category Filter -->
    <div class="category-filter">
        <button onclick="filterCategory('all')">All</button>
        <button onclick="filterCategory('Electronics')">Laptop</button>
        <button onclick="filterCategory('Mobiles')">Phone</button>
        <button onclick="filterCategory('Fashion')">Fashion</button>
        <button onclick="filterCategory('Accessories')">Accessories</button>
    </div>
    
    <!-- Products Grid -->
    <div class="product-grid" id="productGrid">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "Siba@2006");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM products");

                while (rs.next()) {
        %>
            <div class="product-card" data-category="<%= rs.getString("category") %>">
                <img src="<%= request.getContextPath() %>/images/<%= rs.getString("image_url") %>" alt="<%= rs.getString("name") %>">
                <h3><%= rs.getString("name") %></h3>
                <p><%= rs.getString("description") %></p>
                <p class="price">₹<%= rs.getDouble("price") %></p>
                <div class="btn-container">
                    <a href="addToCart.jsp?id=<%= rs.getInt("id") %>" class="btn secondary">Add to Cart</a>
                    <a href="buyNow.jsp?id=<%= rs.getInt("id") %>" class="btn">Buy Now</a>
                </div>
            </div>
        <%
                }
            } catch (Exception e) {
                out.println("<p style='color:#7f8c8d;text-align:center;padding:20px;'>Error loading products!</p>");
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>

    <!-- Profile -->
    <div class="profile-container">
        <div class="profile" onclick="toggleDropdown()">
            <img src="https://i.pravatar.cc/100" alt="Avatar">
            <span><%= session.getAttribute("username") != null ? session.getAttribute("username") : "Guest" %></span>
        </div>
        <div class="dropdown" id="profileDropdown">
            <a href="profile.jsp">View Profile</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <script>
        function toggleDropdown() {
            let dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }
        
        document.addEventListener("click", function(event) {
            let profile = document.querySelector(".profile");
            let dropdown = document.getElementById("profileDropdown");
            if (!profile.contains(event.target) && !dropdown.contains(event.target)) {
                dropdown.style.display = "none";
            }
        });
        
        // Search functionality
        document.getElementById("searchInput").addEventListener("keyup", function() {
            let filter = this.value.toLowerCase();
            document.querySelectorAll(".product-card").forEach(product => {
                let name = product.querySelector("h3").innerText.toLowerCase();
                product.style.display = name.includes(filter) ? "block" : "none";
            });
        });
        
        // Category filter
        function filterCategory(category) {
            document.querySelectorAll(".product-card").forEach(product => {
                if (category === "all" || product.dataset.category === category) {
                    product.style.display = "block";
                } else {
                    product.style.display = "none";
                }
            });
        }
    </script>
</body>
</html>