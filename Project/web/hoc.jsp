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

            #searchInput {
                width: 100%; /* Độ rộng của thanh tìm kiếm */
                padding: 10px; /* Khoảng cách lề bên trong của input */
                margin-bottom: 20px; /* Khoảng cách với phần nội dung bên dưới */
                border: 1px solid #ccc; /* Viền màu xám nhạt */
                border-radius: 5px; /* Bo góc */
            }

            .highlight {
                background-color: yellow; /* Màu nền vàng cho từ khóa được tìm kiếm */
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
        <main>
            <h1 class="animated">Danh sách câu hỏi lý thuyết</h1>
            <br/><br/>
            <input type="text" id="searchInput" placeholder="Nhập từ khóa để tìm kiếm...">
            <br/>
            <table border="1" id="questionTable" class="animated">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Câu hỏi</th>
                        <th>Đáp án A</th>
                        <th>Đáp án B</th>
                        <th>Đáp án C</th>
                        <th>Đáp án D</th>
                        <th>Đáp án đúng</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${data}" var="q">
                        <tr>
                            <td>${q.getId()}</td>
                            <td>${q.getQuestion_text()}</td>
                            <td>${q.getOption_a()}</td>
                            <td>${q.getOption_b()}</td>
                            <td>${q.getOption_c()}</td>
                            <td>${q.getOption_d()}</td>
                            <td>${q.getCorrect_answer()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
        <footer>
            <p>&copy; 2024 Học và Thi Bằng Lái Xe Máy. All rights reserved.</p>
        </footer>
        <script src="search.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("searchInput").addEventListener("input", function () {
                    var keyword = this.value.trim().toLowerCase();
                    var tableRows = document.querySelectorAll("#questionTable tbody tr");

                    tableRows.forEach(function (row) {
                        var cells = row.querySelectorAll("td");
                        var found = false;

                        // Bắt đầu từ chỉ số 1 để tránh xử lý ô ID
                        for (var i = 1; i < cells.length; i++) {
                            var cellContent = cells[i].textContent.trim().toLowerCase();
                            if (cellContent.includes(keyword)) {
                                found = true;
                                cells[i].innerHTML = cellContent.replace(new RegExp(keyword, 'gi'), function (match) {
                                    return '<span class="highlight">' + match + '</span>';
                                });
                            } else {
                                cells[i].innerHTML = cellContent;
                            }
                        }

                        if (found) {
                            row.classList.add("highlight-row");
                            row.style.display = "";
                        } else {
                            row.classList.remove("highlight-row");
                            row.style.display = "none";
                        }
                    });
                });
            });
        </script>
    </body>
</html>
