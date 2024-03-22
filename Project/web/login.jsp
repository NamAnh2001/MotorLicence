<%-- 
    Document   : login
    Created on : Mar 12, 2024, 11:42:29 AM
    Author     : TRANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #ffffff; /* Trắng */
                text-align: center;
            }

            header {
                background-color: #2ecc71; /* Màu xanh lá cây */
                padding: 20px;
                color: #ffffff; /* Trắng */
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                background-color: #27ae60; /* Màu xanh lá cây nhạt */
            }

            nav ul li {
                display: inline-block;
            }

            nav ul li a {
                display: block;
                padding: 10px 20px;
                color: #ffffff; /* Trắng */
                text-decoration: none;
            }

            nav ul li a:hover {
                background-color: #1d8348; /* Màu xanh lá cây đậm */
            }

            main {
                padding: 20px;
            }

            footer {
                background-color: #2ecc71; /* Màu xanh lá cây */
                padding: 10px;
                color: #ffffff; /* Trắng */
                text-align: center;
            }
            .login-container {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 300px;
                margin: 0 auto;
            }
            .login-container h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }
            .login-form {
                display: flex;
                flex-direction: column;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                margin-bottom: 5px;
                color: #333;
                font-weight: bold;
            }
            .form-group input {
                padding: 10px;
                border-radius: 3px;
                border: 1px solid #ccc;
                font-size: 16px;
            }
            .form-group button {
                padding: 10px;
                border-radius: 3px;
                border: none;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            .form-group button:hover {
                background-color: #0056b3;
            }
            /* Hiệu ứng animation */
            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateY(-50px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animated {
                animation-duration: 0.5s;
                animation-fill-mode: both;
                animation-name: slideIn;
                text-align: center;
        </style>
    </head>
    <body>
        <header>
            <h1>Học và Thi Bằng Lái Xe Máy</h1>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Trang chủ</a></li>
                <li><a href="login.jsp">Đăng nhập</a></li>
                <li><a href="/Project/question">Học lý thuyết</a></li>
                <li><a href="quatityQuestion.jsp">Làm bài thi</a></li>
            </ul>
        </nav>
        <br/>
        <div class="login-container">
            <div class="animated">
                <h2>Login</h2>
            <form class="login-form" action="login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <button type="submit">Login</button>
                </div>
            </form>
            </div>
        </div>
        <br/>
        <footer>
            <p>&copy; 2024 Học và Thi Bằng Lái Xe Máy. All rights reserved.</p>
        </footer>
    </body>
</html>
