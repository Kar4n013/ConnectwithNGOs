package Dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import db_config.GetConnection;

public class RegistrationDao {
	String query;
	PreparedStatement statement;

	public boolean insert(String name, String phone, String email, String state, String district, String password,
			String role) {

		if (role.equals("admin")) {
			query = "insert into admin (name, phone, email, state, district, password) values (?,?,?,?,?,sha2(?,256))";
		} else if(role.equals("donor")){
			query = "insert into donor (name, phone, email, state, district, password) values (?,?,?,?,?,sha2(?,256))";
		}
		

		try {
			statement = GetConnection.getConnection().prepareStatement(query);
			statement.setString(1, name);
			statement.setString(2, phone);
			statement.setString(3, email);
			statement.setString(4, state);
			statement.setString(5, district);
			statement.setString(6, password);
			if (!statement.execute()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

}
