package com.demo.controller;

import com.demo.dao.UserDao;
import com.demo.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/SeeAllUsers")
public class SeeAllUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        UserDao userDao = new UserDao();
        try {
            // Fetch all users from the database
            List<User> users = userDao.getAllUsers();
            
            // Attach the users list to the request and forward it to the view JSP
            request.setAttribute("users", users);

            // Get any potential message (e.g., from actions like delete) and pass it to the JSP
            String message = request.getParameter("message");
            if (message != null) {
                request.setAttribute("message", message);
            }
            request.getRequestDispatcher("viewUsers.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", " Please try again later.");
            request.getRequestDispatcher("home.jsp").forward(request, response); 
        }
    }
}
