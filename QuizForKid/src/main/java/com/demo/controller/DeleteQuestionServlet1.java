package com.demo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.demo.dao.QuizDao;

/**
 * Servlet implementation class DeleteQuestionServlet1
 */
public class DeleteQuestionServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteQuestionServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int questionId = Integer.parseInt(request.getParameter("id"));
	        boolean isDeleted = false;
	        QuizDao dao=new QuizDao();
	        HttpSession session=request.getSession();
	        session.removeAttribute("message");
	        try {
	            isDeleted = dao.deleteQuestion(questionId);
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }

	       
	        if (isDeleted) {
	            session.setAttribute("message", "Question deleted successfully.");
	            
	        } else {
	            session.setAttribute("error", "Failed to delete the question.");
	        }

	       
	        response.sendRedirect("allQuestions.jsp");
	    }
}
