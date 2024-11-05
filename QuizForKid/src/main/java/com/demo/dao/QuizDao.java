package com.demo.dao;

import com.demo.model.Quiz;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuizDao {
    
    // Method to get all questions by level ID
    public List<Quiz> getAllQuestionByLevelId(int levelid) throws SQLException, ClassNotFoundException {
        List<Quiz> list = new ArrayList<>();
        MyConnection conObj = new MyConnection();
        Connection con = conObj.getConnection();
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM quiz WHERE levelid=? ORDER BY RAND() LIMIT 15");
        pstm.setInt(1, levelid);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Quiz q = new Quiz();
            q.setQuizid(rs.getInt(1));
            q.setQuestions(rs.getString(2));
            q.setOption1(rs.getString(3));
            q.setOption2(rs.getString(4));
            q.setOption3(rs.getString(5));
            q.setCorrectanswer(rs.getString(6));  
            q.setLevelid(rs.getInt(7));
            list.add(q);
        }
        return list;
    }

    // Method to get all questions
    public List<Quiz> getAllQuestions() throws ClassNotFoundException, SQLException {
        List<Quiz> questions = new ArrayList<>();
        String sql = "SELECT * FROM quiz";
        MyConnection conobj = new MyConnection();
        Connection conn = conobj.getConnection();
       
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Quiz question = new Quiz();
            question.setQuizid(rs.getInt("quizid")); 
            question.setQuestions(rs.getString("questions"));
            question.setOption1(rs.getString("option1"));
            question.setOption2(rs.getString("option2"));
            question.setOption3(rs.getString("option3"));
            question.setCorrectanswer(rs.getString("correctanswer"));
            question.setLevelid(rs.getInt("levelid"));
            questions.add(question);
        }
        return questions;
    }

  
        // Method to add a new question
        public boolean addQuestion(String question, String option1, String option2, String option3, String correctAns, int levelid) throws ClassNotFoundException, SQLException {
            MyConnection conobj = new MyConnection();
            boolean flag = false;
            Connection conn = conobj.getConnection();
            String sql = "INSERT INTO quiz (questions, option1, option2, option3, correctanswer, levelid) VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, question);
                stmt.setString(2, option1);
                stmt.setString(3, option2);
                stmt.setString(4, option3);
                stmt.setString(5, correctAns);
                stmt.setInt(6, levelid);
                int row = stmt.executeUpdate();
                if (row > 0) {
                    flag = true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                conn.close(); // Ensure the connection is closed
            }
            return flag;
        }
    

    // Method to delete a question
    public boolean deleteQuestion(int id) throws ClassNotFoundException, SQLException {
        boolean flag = false;
        String sql = "DELETE FROM quiz WHERE quizid = ?";
        MyConnection conobj = new MyConnection();
        Connection conn = conobj.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        int row = stmt.executeUpdate();
        if (row > 0)
            flag = true;
        return flag;
    }

    // Method to get a question by quiz ID
    public Quiz getQuestionByQuizId(int id) throws ClassNotFoundException, SQLException {
        Quiz question = null;
        String sql = "SELECT * FROM quiz WHERE quizid = ?";
        MyConnection conobj = new MyConnection();
        Connection conn = conobj.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            question = new Quiz();
            question.setQuizid(rs.getInt("quizid")); 
            question.setQuestions(rs.getString("questions"));
            question.setOption1(rs.getString("option1"));
            question.setOption2(rs.getString("option2"));
            question.setOption3(rs.getString("option3"));
            question.setCorrectanswer(rs.getString("correctanswer"));
            question.setLevelid(rs.getInt("levelid"));        
        } 
        return question;
    }

    // Method to update a question
    public boolean updateQuestion(String question, String option1, String option2, String option3, String correctAns, int levelid, int quizid) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE quiz SET questions = ?, option1 = ?, option2 = ?, option3 = ?, correctanswer = ?, levelid = ? WHERE quizid = ?";
        MyConnection conobj = new MyConnection();
        boolean flag = false;
        Connection conn = conobj.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, question);
        stmt.setString(2, option1);
        stmt.setString(3, option2);
        stmt.setString(4, option3);
        stmt.setString(5, correctAns);
        stmt.setInt(6, levelid);
        stmt.setInt(7, quizid);
        int row = stmt.executeUpdate();
        if (row > 0)
            flag = true;
        return flag;
    }

    // Method to get the total number of questions
    public int getTotalQuestions() throws ClassNotFoundException, SQLException {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM quiz";
        MyConnection conobj = new MyConnection();
        Connection conn = conobj.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            total = rs.getInt(1);
        }
        return total;
    }
}
