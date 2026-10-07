package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import db_config.GetConnection;
import model.User_pojo;

public class UserDao {
	Connection connection = GetConnection.getConnection();
	public User_pojo userdetails(String email,String role) {
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select * from get_"+role+" where email = ?");
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return new User_pojo(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getString("phone"), resultSet.getString("email"),resultSet.getString("address"), role); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
