
package com.demo.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MyConnection {
	public Connection getConnection() throws ClassNotFoundException, SQLException {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection
			("jdbc:mysql://localhost:3307/quizedb","root","root");
	return con;
	}
}