/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Models.Question;
import Models.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import Controller.SetNumberQuestionServlet;

/**
 *
 * @author TRANG
 */
public class QuizServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuizServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy số lượng câu hỏi từ session
        HttpSession session = request.getSession();
        Integer numberOfQuestions = (Integer) session.getAttribute("numberOfQuestions");

        // Kiểm tra xem có số lượng câu hỏi hay không
        if (numberOfQuestions != null) {
            QuestionDAO questionDao = new QuestionDAO();
            List<Question> questionList = questionDao.getQuestions();
            List<Question> questionQuiz = new ArrayList<>();

            // Lấy số lượng câu hỏi theo số lượng đã được chỉ định
            int countQuestion = 0;
            for (Question question : questionList) {
                questionQuiz.add(question);
                countQuestion++;
                if (countQuestion == numberOfQuestions) {
                    break;
                }
            }
            Collections.shuffle(questionQuiz);

            // Đảo ngẫu nhiên các đáp án của mỗi câu hỏi
            for (Question question : questionQuiz) {
                List<String> options = Arrays.asList(question.getOption_a(), question.getOption_b(), question.getOption_c(), question.getOption_d());
                Collections.shuffle(options);
                question.setOption_a(options.get(0));
                question.setOption_b(options.get(1));
                question.setOption_c(options.get(2));
                question.setOption_d(options.get(3));
            }

            // Lưu danh sách câu hỏi vào session
            session.setAttribute("questionQuiz", questionQuiz);
            request.getRequestDispatcher("thi.jsp").forward(request, response);
        } else {
            // Xử lý trường hợp không có số lượng câu hỏi trong session
            // Chẳng hạn, chuyển hướng người dùng đến trang nhập số lượng câu hỏi
            response.sendRedirect("quantityQuestion.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Truy xuất danh sách câu hỏi từ session
        HttpSession session = request.getSession();
        List<Question> questionQuiz = (List<Question>) session.getAttribute("questionQuiz");

        // Tiếp tục xử lý bài thi và hiển thị kết quả
        if (questionQuiz != null) {
            int correctCount = 0;
            for (Question question : questionQuiz) {
                if (request.getParameter("q" + question.getId()) != null) {
                    String userAnswer = request.getParameter("q" + question.getId());
                    String correctAnswer = question.getCorrect_answer();
                    request.setAttribute("q" + question.getId(), correctAnswer);
                    request.setAttribute("result" + question.getId(), userAnswer.equals(correctAnswer)
                            ? "<span style='color: blue;'>Đúng</span><br>Đáp án đúng là: " + userAnswer
                            : "<span style='color: red;'>Sai</span><br>Đáp án đúng là: "
                            + question.getCorrect_answer() + "<br/>Đáp án bạn chọn là: " + userAnswer);
                    if (userAnswer.equals(correctAnswer)) {
                        correctCount++;
                    }
                } else {
                    request.setAttribute("result" + question.getId(), "<span style='color: orange;'>Bạn chưa chọn đáp án</span>");
                }
            }
            if (correctCount >= 7) {
                request.setAttribute("resultMessage", "<span style='color: blue;'>Xin chúc mừng bạn đã đạt bài thi</span>");
            } else {
                request.setAttribute("resultMessage", "<span style='color: red;'>Rất tiếc bạn đã trượt hãy cố gắng hơn ở lần sau</span>");
            }
            // Cài đặt biến để ẩn phần JSP khi trang được tải lại sau khi submit
            request.setAttribute("hideCountdownContainer", true);
            request.getRequestDispatcher("thi.jsp").forward(request, response);
        }

    }
}
