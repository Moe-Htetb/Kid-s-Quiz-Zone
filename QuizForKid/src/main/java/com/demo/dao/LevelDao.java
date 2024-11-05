package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LevelDao {
public String getlevelname(int levelid) throws ClassNotFoundException, SQLException {
	String levelname=null;
	 MyConnection conObj = new MyConnection();
     Connection con = conObj.getConnection();
     PreparedStatement pstm = con.prepareStatement("SELECT levelname FROM level WHERE levelid=?");
     pstm.setInt(1, levelid);
     ResultSet rs=pstm.executeQuery();
     if(rs.next())
    	 levelname=rs.getString(1);
     return levelname;
}
	 

}
