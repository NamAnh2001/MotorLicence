<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %> <!-- Thêm import cho lớp Arrays -->
<%@ page import="Models.Question" %>
<%@ page import="java.util.Collections" %>
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
                background-color: #ffffff; /* White */
                text-align: center;
            }

            header {
                background-color: #2ecc71; /* Green */
                padding: 20px;
                color: #ffffff; /* White */
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                background-color: #27ae60; /* Light green */
            }

            nav ul li {
                display: inline-block;
            }

            nav ul li a {
                display: block;
                padding: 10px 20px;
                color: #ffffff; /* White */
                text-decoration: none;
            }

            nav ul li a:hover {
                background-color: #1d8348; /* Dark green */
            }

            main {
                padding: 20px;
            }

            footer {
                background-color: #2ecc71; /* Green */
                padding: 10px;
                color: #ffffff; /* White */
                text-align: center;
            }

            h1 {
                margin-top: 20px;
                font-size: 24px;
                color: #2ecc71; /* Green */
            }

            h3 {
                font-size: 18px;
                color: #2ecc71; /* Green */
                margin-top: 20px;
            }

            p {
                font-size: 16px;
                margin-bottom: 10px;
            }

            input[type="radio"] {
                margin-bottom: 5px;
            }

            input[type="submit"] {
                background-color: #2ecc71; /* Green */
                color: #ffffff; /* White */
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }

            input[type="submit"]:hover {
                background-color: #1d8348; /* Dark green */
            }

            .question-container {
                align-items: flex-start; /* Căn trên cùng */
                justify-content: space-between;
                margin-bottom: 20px; /* Khoảng cách giữa các câu hỏi */
                border: 1px solid green;
                padding: 10px; /* Khoảng cách nội dung từ border */
                border-radius: 50px;
                background-color: #f5f6fa;
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

            #countdown {
                font-size: 24px;
                color: #ffffff; /* Màu trắng */
                background-color: #2ecc71; /* Màu xanh lá cây */
                padding: 5px 10px;
                border-radius: 5px;
                display: inline-block;
            }
        </style>
    </head>
    <body onload="startCountdown()">
        <header>
            <h1 style="color: white">Học và Thi Bằng Lái Xe Máy</h1>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Trang chủ</a></li>
                <li><a href="login.jsp">Đăng nhập</a></li>
                <li><a href="/Project/question">Học lý thuyết</a></li>
                <li><a href="quatityQuestion.jsp">Làm bài thi</a></li>
            </ul>
        </nav>
        <div class="animated">

            <h1>Làm bài thi</h1>

            <p style="font-weight: bold; <%= (request.getAttribute("resultMessage") != null && !request.getAttribute("resultMessage").toString().trim().isEmpty()) ? "display: block;" : "display: none;" %>">
                <%= request.getAttribute("resultMessage") %>
            </p>

            <form action="thi" method="post" id='quizForm'>
                <%
                    // Lấy danh sách câu hỏi từ session
                    List<Question> questions = (List<Question>) request.getSession().getAttribute("questionQuiz");
                    int questionCounter = 1;
                    if (questions != null) {
                        for (Question question : questions) {
                            // Đảo ngẫu nhiên các đáp án cho mỗi câu hỏi
                            String[] options = {question.getOption_a(), question.getOption_b(), question.getOption_c(), question.getOption_d()};
                            Collections.shuffle(Arrays.asList(options));
                %>
                <div class="question-container">
                    <h3>Câu Hỏi Số <%= questionCounter %> :</h3>
                    <% questionCounter++; %>
                    <p><%= question.getQuestion_text() %></p>
                    <input type="radio" name="q<%= question.getId() %>" value="<%= options[0] %>" <%= (request.getAttribute("q" + question.getId()) + "").equals("a") ? "checked" : "" %>>A.<%= options[0] %> <br/>
                    <input type="radio" name="q<%= question.getId() %>" value="<%= options[1] %>" <%= (request.getAttribute("q" + question.getId()) + "").equals("b") ? "checked" : "" %>>B.<%= options[1] %> <br/>
                    <input type="radio" name="q<%= question.getId() %>" value="<%= options[2] %>" <%= (request.getAttribute("q" + question.getId()) + "").equals("c") ? "checked" : "" %>>C.<%= options[2] %> <br/>
                    <input type="radio" name="q<%= question.getId() %>" value="<%= options[3] %>" <%= (request.getAttribute("q" + question.getId()) + "").equals("d") ? "checked" : "" %>>D.<%= options[3] %> <br/>
                    <span style="font-weight: bold; <%= (request.getAttribute("result" + question.getId()) != null && !request.getAttribute("result" + question.getId()).toString().trim().isEmpty()) ? "display: block;" : "display: none;" %>">
                        Kết quả: <%= request.getAttribute("result" + question.getId()) %>
                    </span>
                    <br><br>
                </div>
                <%
                        }
                    }
                %>
                </c:forEach>
                <input type="submit" value="Nộp bài" onclick="submitted = true; hideCountdown();">
                <br/><br/>
                <div style="font-weight: bold; ${not empty requestScope.hideCountdownContainer ? 'display: none;' : 'display: block;'}" id="countdownContainer">Thời gian còn lại: <span id="countdown"></span></div>
                <br/><br/>
            </form>
        </div>
        <footer>
            <p>&copy; 2024 Học và Thi Bằng Lái Xe Máy. All rights reserved.</p>
        </footer>
        <script>
            var countdownTime = 600;
            var submitted = false;

            function startCountdown() {
                var countdownInterval = setInterval(function () {
                    if (!submitted) {
                        countdownTime--;
                        document.getElementById("countdown").innerText = formatTime(countdownTime);
                        if (countdownTime <= 0) {
                            clearInterval(countdownInterval);
                            alert("Thời gian đã kết thúc!");
                            document.getElementById("quizForm").submit();
                            submitted = true;
                        }
                    }
                }, 1000);
            }

            function formatTime(seconds) {
                var minutes = Math.floor(seconds / 60);
                var remainingSeconds = seconds % 60;
                return minutes + ":" + (remainingSeconds < 10 ? "0" : "") + remainingSeconds;
            }

            // Add event listener to form submission
            document.getElementById("quizForm").addEventListener("submit", function () {
                document.getElementById("countdownContainer").style.display = "none";
            });

        </script>

</html>
