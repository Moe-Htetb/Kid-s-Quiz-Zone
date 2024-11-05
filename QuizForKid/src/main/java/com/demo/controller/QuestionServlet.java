package com.demo.controller;

 

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/questions")
public class QuestionServlet extends HttpServlet {
	/*
    private QuestionDao questionDao = new QuestionDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int questionId = Integer.parseInt(request.getParameter("id"));
            questionDao.deleteQuestion(questionId);
            response.sendRedirect("admin/questions?action=list");
        } else {
            List<Question> questions = questionDao.getAllQuestions();
            request.setAttribute("questions", questions);
            request.getRequestDispatcher("/allQuestions.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String questionText = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String correctAnswer = request.getParameter("correctAnswer");
        int levelId = Integer.parseInt(request.getParameter("levelId"));

        Question question = new Question(levelId, questionText, option1, option2, option3, correctAnswer, levelId);
        questionDao.addQuestion(question);

        response.sendRedirect("admin/questions?action=list");
       
    } */
}
