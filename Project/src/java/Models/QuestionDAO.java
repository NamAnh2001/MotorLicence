/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

;
import java.sql.*;
import java.util.ArrayList;
import dal.DBContext;

/**
 *
 * @author TRANG
 */


public class QuestionDAO extends DBContext {
    //Khai báo các thành phần xử lý 

    Connection cnn;//Kết nối DB
    PreparedStatement stm; //Thực hiện các câu lệnh SQL
    ResultSet rs; // Lưu trữ và xử lý dữ liệu được lấy về từ select

    public QuestionDAO() {
        connect();
    }

    private void connect() {
        try {
            cnn = connection;
            if (cnn != null) {
                System.out.println("Connection success");
            } else {
                System.out.println("Connect fail");
            }
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }

    public ArrayList<Question> getQuestions() {
        ArrayList<Question> data = new ArrayList<>();
        try {
            String strSQL = "select * from questions";
            stm = cnn.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String question_text = rs.getString(2);
                String option_a = rs.getString(3);
                String option_b = rs.getString(4);
                String option_c = rs.getString(5);
                String option_d = rs.getString(6);
                String question_answer = rs.getString(7);
                Question q = new Question(id, question_text, option_a, option_b, option_c, option_d, question_answer);
                data.add(q);
            }

        } catch (Exception e) {
            System.out.println("getQuestions:" + e.getMessage());
        }
        return data;
    }

    public void addQuestion(Question q) {
        try {
            String strSQL = "INSERT INTO questions(question_text,option_a,option_b,option_c,option_d,correct_answer) values(?,?,?,?,?,?)";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, q.getQuestion_text());
            stm.setString(2, q.getOption_a());
            stm.setString(3, q.getOption_b());
            stm.setString(4, q.getOption_c());
            stm.setString(5, q.getOption_d());
            stm.setString(6, q.getCorrect_answer());
            stm.execute();
        } catch (Exception e) {
            System.out.println("insertQuestion:" + e.getMessage());
        }
    }
       public void delete(String id) {
        try {
            String strSQL = "delete from questions where id =?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, id);
            stm.execute();
        } catch (Exception e) {
            System.out.println("delete:" + e.getMessage());
        }
    }
       public Question getQuestionById(String id1) {
        try {
            String strSQL = "select * from questions where Id=?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, id1);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String question_text = rs.getString(2);
                String option_a = rs.getString(3);
                String option_b = rs.getString(4);
                String option_c = rs.getString(5);
                String option_d = rs.getString(6);
                String correct_anwser = rs.getString(6);
                Question q = new Question(id, question_text, option_a, option_b, option_c, option_d, correct_anwser);
                return q;
            }

        } catch (Exception e) {
            System.out.println("getQuestionById:" + e.getMessage());
        }
        return null;
    }

    public void updateQuestion(Question q) {
       try {
            String strSQL = "update questions set question_text =? , option_a =?, option_b=?, option_c=?, option_d=?,correct_answer=? where id=?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, q.question_text);
            stm.setString(2, q.option_a);
            stm.setString(3, q.option_b);
            stm.setString(4, q.option_c);
            stm.setString(5, q.option_d);
            stm.setString(6, q.correct_answer);
            stm.setString(7, q.id);
            stm.execute();
        } catch (Exception e) {
            System.out.println("updateQuestion:" + e.getMessage());
        }
    }
}
