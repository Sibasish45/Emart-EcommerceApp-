<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Registration</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }
        
        .registration-container {
            width: 100%;
            max-width: 450px;
            padding: 20px;
        }
        
        .card {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 40px 30px;
            text-align: center;
        }
        
        h2 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #2c3e50;
        }
        
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
            font-size: 14px;
        }
        
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 15px;
            transition: border 0.3s, box-shadow 0.3s;
            outline: none;
        }
        
        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }
        
        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: #3498db;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }
        
        input[type="submit"]:hover {
            background: #2980b9;
        }
        
        .link {
            margin-top: 25px;
            font-size: 14px;
            color: #7f8c8d;
        }
        
        .link a {
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .link a:hover {
            color: #2980b9;
            text-decoration: underline;
        }
        
        .error {
            color: #e74c3c;
            margin-top: 15px;
            font-size: 14px;
            padding: 10px;
            background-color: #fdecea;
            border-radius: 6px;
            border-left: 4px solid #e74c3c;
            text-align: left;
        }
        
        .logo {
            margin-bottom: 30px;
        }
        
        .logo img {
            height: 60px;
        }
        
        .form-note {
            font-size: 12px;
            color: #7f8c8d;
            margin-top: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="card">
            <div class="logo">
                <img src="https://i.imgur.com/zYi5q2D.png" alt="Logo">
            </div>
            
            <h2>Create Account</h2>
            
            <form action="UserServlet" method="post">
                <input type="hidden" name="action" value="register"/>
                
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" placeholder="Enter your full name" required/>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required/>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Create a password" required/>
                    <div class="form-note">Use 8 or more characters with a mix of letters, numbers & symbols</div>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" placeholder="Enter your phone number"/>
                </div>
                
                <input type="submit" value="Create Account"/>
            </form>

            <% if (request.getParameter("error") != null) { %>
                <div class="error">Registration failed. Please check your information and try again.</div>
            <% } %>

            <div class="link">
                Already have an account? <a href="login.jsp">Login here</a>
            </div>
        </div>
    </div>
</body>
</html>