package com.demo.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.model.User;

public class UserDao {

    // Method to log in a user
    public User loginUser(String email, String password) throws ClassNotFoundException, SQLException {
        User user = null;
        MyConnection conobj = new MyConnection();
        Connection con = conobj.getConnection();
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM user WHERE email=? AND password=?");
        pstm.setString(1, email);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            user = new User();
            user.setUserid(rs.getInt("userid"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
        }

        return user;
    }

    // Method to check if a user with a given email already exists
    public boolean checkAlreadyUser(String email) throws ClassNotFoundException, SQLException {
        boolean flag = false;
        MyConnection conobj = new MyConnection();
        Connection con = conobj.getConnection();
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM user WHERE email=?");
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            flag = true;
        }

        return flag;
    }

    // Method to sign up a new user
    public boolean signupUser(String name, String email, String password) throws ClassNotFoundException, SQLException, IOException {
        boolean flag = false;
        MyConnection conobj = new MyConnection();
        Connection con = conobj.getConnection();

        PreparedStatement pstm = con.prepareStatement("INSERT INTO user (name, email, password) VALUES (?, ?, ?)");
        pstm.setString(1, name);
        pstm.setString(2, email);
        pstm.setString(3, password);
        int row = pstm.executeUpdate();
        if (row > 0) {
            flag = true;
        }

        return flag;
    }

    // Method to retrieve all users from the database
    public List<User> getAllUsers() throws SQLException, ClassNotFoundException {
        List<User> users = new ArrayList<>();
        MyConnection conobj = new MyConnection();
        Connection con = conobj.getConnection();
        String sql = "SELECT * FROM user";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            User user = new User();
            user.setUserid(rs.getInt("userid"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            // Add more fields if necessary

            users.add(user);
        }

        return users;
    }

    // Method to delete a user by user ID
    public boolean deleteUser(int userid) throws SQLException, ClassNotFoundException {
        boolean flag = false;
        MyConnection conobj = new MyConnection();
        Connection con = conobj.getConnection();
        PreparedStatement pstm = con.prepareStatement("DELETE FROM user WHERE userid=?");
        pstm.setInt(1, userid);
        int row = pstm.executeUpdate();
        if (row > 0) {
            flag = true;
        }

        return flag;
    }

//To See Total User in admin Dash borad
    public int getTotalUsers() throws ClassNotFoundException, SQLException {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM user WHERE email IS NOT NULL AND password IS NOT NULL"; // Adjust the conditions as needed
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
