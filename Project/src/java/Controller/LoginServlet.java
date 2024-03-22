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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author TRANG
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
            QuestionDAO d = new QuestionDAO();
            ArrayList<Question> data = d.getQuestions();
            request.setAttribute("data", data);
            request.getRequestDispatcher("adminPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        QuestionDAO d = new QuestionDAO();
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
            ArrayList<Question> data1 = d.getQuestions();
            request.setAttribute("data1", data1);
            request.getRequestDispatcher("addQuestions.jsp").forward(request, response);
        }
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("2")) {
            String id = request.getParameter("id");
            d.delete(id);
        }
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("3")) {
            String id = request.getParameter("id");
            Question q = d.getQuestionById(id);
            String rA = request.getParameter("rightAnswer") + "";
            request.setAttribute("q", q);

            ArrayList<Question> data1 = d.getQuestions();
            request.setAttribute("data1", data1);
            request.setAttribute("rA", rA);
            request.getRequestDispatcher("updateQuestions.jsp").forward(request, response);
        }
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Xác định tên người dùng và mật khẩu của admin
        String adminUsername = "admin";
        String adminPassword = "123";

        // So sánh tên người dùng và mật khẩu với tên người dùng và mật khẩu của admin
        if (adminUsername.equals(username) && adminPassword.equals(password)) {
            //response.sendRedirect("index.jsp");
            processRequest(request, response);
        } else {
            // Nếu không khớp, hiển thị thông báo đăng nhập không thành công
            response.sendRedirect("login.jsp?error=1");
            return;
        }
    }

}
