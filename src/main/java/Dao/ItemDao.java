package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db_config.GetConnection;
import model.Item_pojo;
import model.User_pojo;

public class ItemDao {
	
	User_pojo user_pojo;
	Item_pojo item_pojo;
	
	public ItemDao(User_pojo profile_pojo,Item_pojo item_pojo) {
		this.user_pojo = profile_pojo;
		this.item_pojo = item_pojo;
	}
	
	Connection connection = GetConnection.getConnection();
	PreparedStatement preparedStatement;
	
	public boolean insertItem() {
			try {
				preparedStatement = connection.prepareStatement("insert into items (email,phone,item_title,item_name,category,item_description)"
						+ "values (?,?,?,?,?,?)");
				
				preparedStatement.setString(1, user_pojo.getEmail());
				preparedStatement.setString(2, user_pojo.getNumber());
				preparedStatement.setString(3, item_pojo.getItem_title());
				preparedStatement.setString(4, item_pojo.getItem_name());
				preparedStatement.setString(5, item_pojo.getItem_category());
				preparedStatement.setString(6, item_pojo.getItem_description());
				
				
				if (!preparedStatement.execute()) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		
		return false;

	}
}
