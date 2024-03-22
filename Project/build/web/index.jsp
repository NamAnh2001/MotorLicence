<%-- 
    Document   : index
    Created on : Mar 3, 2024, 7:57:16 PM
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
            }
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
        <main class="animated">
            <h2>Chào mừng bạn đến với trang web Học và Thi Bằng Lái Xe Máy</h2>
            <p>
                Trang web này cung cấp các tài liệu học, bài kiểm tra và kết quả thi liên quan đến bằng lái xe máy.
            </p>
            <p>
                Hãy sử dụng các liên kết ở trên để truy cập các chức năng của trang web.
            </p>
            <p>
                Chúc mọi người học và thi đạt kết quả tốt nhé.
            </p>
        </main>
        <footer>
            <p>&copy; 2024 Học và Thi Bằng Lái Xe Máy. All rights reserved.</p>
        </footer>
    </body>
</html>
