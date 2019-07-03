package com.service.log;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ADBConnection 
{
	String dbtime="";
	//String dbUrl = "jdbc:mysql://10.36.76.150:3306/openfire";
	String dbUrl = "jdbc:mysql://10.36.76.123:3306/rave2";
	String dbClass = "com.mysql.jdbc.Driver";
	String query=null;


	public List<String> GetUidpass(String user)
	{
		List<String> keys=new ArrayList<String>();
		try 
		{
			query ="SELECT entity_id,password FROM person  where username='"+user+"'";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(dbUrl, "root", "root");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				keys.add(rs.getString(1));
				keys.add(rs.getString(2));
			} 
			
			con.close();
			stmt.close();
			rs.close();

			return keys;
		} //end try

		catch (ClassNotFoundException e) {
			e.printStackTrace();
			return keys;
		}

		catch (SQLException e) {

			e.printStackTrace();
			return keys;
		}
	}

}
