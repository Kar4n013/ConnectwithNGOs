package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import db_config.GetConnection;

public class RegistrationDao {
	String query;
	Connection connection = GetConnection.getConnection();
	CallableStatement statement;

	public boolean insert(String name, String phone, String email, String state, String district, String password,
			String role) {

		if (role.equals("admin")) {
			query = "call add_admin(";
		} else if(role.equals("donor")){
			query = "call add_donor(";
		}

		try {
			statement = connection.prepareCall(query+"?,?,?,?,?,?)");
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
