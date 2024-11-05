package com.demo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.demo.dao.UserDao;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SignupServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("alreadyUser");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
         
 
        UserDao dao = new UserDao();
        try {
            boolean isExistingUser = dao.checkAlreadyUser(email);
            if (!isExistingUser) {
                boolean isSignupSuccessful = dao.signupUser(name, email, password);

                if (isSignupSuccessful) {
                    response.sendRedirect("./login.jsp");
                }  
            } else {
                session.setAttribute("alreadyUser", email);
                response.sendRedirect("./signup.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            //response.sendRedirect("./error.jsp"); // Redirect to an error page or handle accordingly
        }
       
    }
}
