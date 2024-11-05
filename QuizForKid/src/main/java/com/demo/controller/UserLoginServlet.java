package com.demo.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.demo.dao.UserDao; 
import com.demo.model.User;
 
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("errorPassword");
		session.removeAttribute("loginStudent");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	 
		UserDao dao=new UserDao();
		try {
			User stu = dao.loginUser(email, password);
			if (stu == null) {

				session.setAttribute("errorPassword", email);
				response.sendRedirect("./login.jsp");
				
			} else {
				session.setAttribute("loginStudent",stu);
				response.sendRedirect("./home.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}

}

