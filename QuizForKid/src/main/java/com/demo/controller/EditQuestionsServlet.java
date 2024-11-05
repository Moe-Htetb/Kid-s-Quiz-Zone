package com.demo.controller;

import com.demo.dao.QuizDao;
import com.demo.model.Quiz;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class EditQuestionsServlet extends HttpServlet {
    private static final int HttpServletResponse = 0;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String question = request.getParameter("questions");
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String correctAnswer = request.getParameter("correctAnswer");
            int levelId = Integer.parseInt(request.getParameter("levelId"));

            QuizDao dao = new QuizDao();
            boolean isUpdated = dao.updateQuestion(question, option1, option2, option3, correctAnswer, levelId, id);

            if (isUpdated) {
                response.sendRedirect("allQuestions.jsp"); // Redirect to allQuestions.jsp after editing
            } else {
                response.sendError( levelId, "Failed to update the question.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse, "An error occurred while processing the request.");
        }
    }
}
