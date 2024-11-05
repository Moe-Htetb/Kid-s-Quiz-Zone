package com.demo.controller;

import com.demo.dao.QuizDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;


public class DeleteQuestionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuizDao quizDao = new QuizDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int questionId = Integer.parseInt(request.getParameter("id"));
        boolean isDeleted = false;
        	
        try {
            isDeleted = quizDao.deleteQuestion(questionId);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        if (isDeleted) {
            session.setAttribute("message", "Question deleted successfully.");
            
        } else {
            session.setAttribute("error", "Failed to delete the question.");
        }

       
        response.sendRedirect("allQuestions.jsp");
    }
}
