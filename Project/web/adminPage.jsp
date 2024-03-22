<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học lý thuyết</title>
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

            main {
                padding: 20px;
                text-align: left; /* Căn lề trái cho nội dung chính */
            }

            footer {
                background-color: #2ecc71; /* Màu xanh lá cây */
                padding: 10px;
                color: #ffffff; /* Màu trắng */
                text-align: center;
                margin-top: 20px; /* Khoảng cách từ phần nội dung chính */
            }

            table {
                border-collapse: collapse;
                width: 100%;
                margin-top: 20px;
                border: 1px solid #ddd; /* Viền màu xám nhạt */
                background-color: #ffffff; /* Màu nền trắng */
            }

            table th,
            table td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            table th {
                background-color: #2ecc71; /* Màu xanh lá cây */
                color: #ffffff; /* Màu trắng */
                text-align: left;
            }

            table tr:nth-child(even) {
                background-color: #f2f2f2; /* Màu xám nhạt */
            }

            table tr:hover {
                background-color: #ddd; /* Màu xám */
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
            .main-links a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #2ecc71; /* Màu xanh lá cây */
                color: #ffffff; /* Màu trắng */
                text-decoration: none;
                border-radius: 5px; /* Bo tròn góc */
                transition: background-color 0.3s ease; /* Hiệu ứng hover */
            }

            .main-links a:hover {
                background-color: #1d8348; /* Màu xanh lá cây đậm */
            }
            .delete-link {
                color: red; /* Màu chữ đỏ */
                text-decoration: none; /* Loại bỏ gạch chân dưới */
                transition: color 0.3s ease; /* Hiệu ứng màu khi di chuột qua */
            }

            .delete-link:hover {
                color: darkred; /* Màu chữ đỏ đậm khi di chuột qua */
            }
            .id-link {
                color: green; /* Màu chữ xanh */
                text-decoration: none; /* Loại bỏ gạch chân dưới */
                transition: color 0.3s ease; /* Hiệu ứng màu khi di chuột qua */
            }

            .id-link:hover {
                color: darkblue; /* Màu chữ xanh đậm khi di chuột qua */
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
                <li><a href="/Project/question">Học lý thuyết</a></li>
                <li><a href="/Project/thi">Làm bài thi</a></li>
            </ul>
        </nav>
        <main>
            <h1 class="animated">Danh sách các câu hỏi lý thuyết</h1>
            <br/><br/>
            <div class="main-links" >
                <a href="login?mod=1">Thêm câu hỏi mới</a>
            </div>
            <table border="1" class="animated">
                <tr>
                    <td>ID</td>
                    <td>Câu hỏi</td>
                    <td>Đáp án A</td>
                    <td>Đáp án B</td>
                    <td>Đáp án C</td>
                    <td>Đáp án D</td>
                    <td>Đáp án đúng</td>
                    <td>Chức năng</td>
                </tr>
                <c:forEach items="${data}" var="q">
                    <tr>
                        <td><a href="login?mod=3&id=${q.getId()}&rightAnswer=${q.getCorrect_answer()}" class="id-link">${q.getId()}</td>
                        <td>${q.getQuestion_text()}</td>
                        <td>${q.getOption_a()}</td>
                        <td>${q.getOption_b()}</td>
                        <td>${q.getOption_c()}</td>
                        <td>${q.getOption_d()}</td>
                        <td>${q.getCorrect_answer()}</td>
                        <td>
                            <a href="login?mod=2&id=${q.getId()}" class="delete-link">Xóa câu hỏi</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </main>
        <footer>
            <p>&copy; 2024 Học và Thi Bằng Lái Xe Máy. All rights reserved.</p>
        </footer>
    </body>
</html>
