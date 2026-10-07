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
	
	private boolean insertItem() {
			try {
				preparedStatement = connection.prepareStatement("insert into items (name,category,url,description,phone)"
						+ "values (?,?,?,?,?)");
				
				preparedStatement.setString(1, item_pojo.getItem_name());
				preparedStatement.setString(2, item_pojo.getItem_category());
				preparedStatement.setString(3, item_pojo.getItem_url());
				preparedStatement.setString(4, item_pojo.getItem_description());
				preparedStatement.setString(5, user_pojo.getNumber());
				
				
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
