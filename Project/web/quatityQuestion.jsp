<%-- 
    Document   : quatityQuestion
    Created on : Mar 14, 2024, 4:33:34 PM
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
                background-color: #f8f9fa; /* Màu nền xám nhạt */
                text-align: center;
            }

            header {
                background-color: #2ecc71; /* Màu xanh lá cây */
                padding: 20px;
                color: #ffffff; /* Màu trắng */
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                background-color: #27ae60; /* Màu xanh lá cây nhạt */
                border-bottom: 2px solid #1d8348; /* Đường viền dưới màu xanh lá cây đậm */
            }

            nav ul li {
                display: inline-block;
            }

            nav ul li a {
                display: block;
                padding: 10px 20px;
                color: #ffffff; /* Màu trắng */
                text-decoration: none;
                transition: background-color 0.3s ease; /* Hiệu ứng hover */
            }

            nav ul li a:hover {
                background-color: #1d8348; /* Màu xanh lá cây đậm */
            }
            footer {
                background-color: #2ecc71; /* Màu xanh lá cây */
                padding: 10px;
                color: #ffffff; /* Màu trắng */
                text-align: center;
                margin-top: 20px; /* Khoảng cách từ phần nội dung chính */
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
            form {
                margin-top: 20px;
                padding: 20px;
                background-color: #ffffff; /* Màu nền trắng */
                border-radius: 5px; /* Bo góc */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
                width: 400px; /* Độ rộng của form */
                margin: 0 auto; /* Căn giữa form */
                text-align: center;
            }

            input[type="number"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc; /* Viền màu xám nhạt */
                border-radius: 5px; /* Bo góc */
            }

            input[type="submit"] {
                background-color: #2ecc71; /* Màu nền xanh lá cây */
                color: #ffffff; /* Màu chữ trắng */
                border: none;
                padding: 10px 20px;
                border-radius: 5px; /* Bo góc */
                cursor: pointer;
                transition: background-color 0.3s ease; /* Hiệu ứng hover */
            }

            input[type="submit"]:hover {
                background-color: #27ae60; /* Màu nền xanh lá cây nhạt */
            }

        </style>
    </head>
    <body class="animated">
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
        <h1>NHẬP SỐ CÂU HỎI BÀI THI</h1>
        <form action="setnumberq" method="post">
            Số lượng câu hỏi : <input type="number" name="numberOfQuestions"> <br/>
            <input type="submit" value="Submit">
        </form>
        <footer>
            <p>&copy; 2024 Học và Thi Bằng Lái Xe Máy. All rights reserved.</p>
        </footer
    </body>
</html>
