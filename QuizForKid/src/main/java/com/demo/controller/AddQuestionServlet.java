package com.demo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.demo.dao.QuizDao;

import java.io.IOException;
import java.sql.SQLException;


public class AddQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("questions");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String correctAnswer = request.getParameter("correctAnswer");
        int levelId = Integer.parseInt(request.getParameter("levelId"));

        QuizDao quizDao = new QuizDao();
        boolean isAdded = false;

        try {
            isAdded = quizDao.addQuestion(question, option1, option2, option3, correctAnswer, levelId);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        if (isAdded) {
            response.sendRedirect("allQuestions.jsp"); // Redirect to a success page
        } else {
            response.sendRedirect("addQuestions.jsp"); // Redirect to an error page
        }
    }
}
