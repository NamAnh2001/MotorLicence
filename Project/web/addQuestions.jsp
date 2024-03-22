<%-- 
Document   : addQuestions
Created on : Mar 12, 2024, 3:16:26 PM
Author     : TRANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Question Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa; /* Màu nền xám nhạt */
                text-align: center;
            }
            form {
                margin-top: 50px;
                text-align: center;
            }

            input[type="text"] {
                width: 400px; /* Độ rộng */
                height: 60px; /* Chiều cao */
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-sizing: border-box;
                font-size: 16px;
            }

            input[type="submit"] {
                background-color: #2ecc71; /* Màu xanh lá cây */
                color: #ffffff; /* Màu trắng */
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                font-size: 16px;
                border-radius: 5px;
                transition: background-color 0.3s ease; /* Hiệu ứng hover */
            }

            input[type="submit"]:hover {
                background-color: #1d8348; /* Màu xanh lá cây đậm */
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
                <li><a href="/Project/question">Học lý thuyết</a></li>
                <li><a href="/Project/thi">Làm bài thi</a></li>
            </ul>
        </nav>
        <form action="addquestion" method="post" class="animated">
            <h1 style="font-weight: bold; color:green">Thêm câu hỏi mới </h1>
            Nhập câu hỏi : <input type="text" name="questionText" required><br>
            Đáp án A: <input type="text" name="optionA" required><br>
            Đáp án B: <input type="text" name="optionB" required><br>
            Đáp án C: <input type="text" name="optionC" required><br>
            Đáp án D: <input type="text" name="optionD" required><br>
            Đáp án đúng: <input type="text" name="correctAnswer" required><br>
            <input type="submit" name="add" value="Add">
        </form>
        <br/>
        <footer>
            <p>&copy; 2024 Học và Thi Bằng Lái Xe Máy. All rights reserved.</p>
        </footer>
    </body>
</html>
