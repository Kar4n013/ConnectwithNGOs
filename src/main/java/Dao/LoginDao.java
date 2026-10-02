package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db_config.GetConnection;

public class LoginDao {
	public static boolean login(String userId, String password, String dept) {
		String input;
		if (userId.contains("com")) {
			input = "email";
		} else {
			input = "phone";
		}

		try (Connection connection = GetConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(
						"SELECT 1 FROM " + dept + " WHERE " + input + " = ? AND password = SHA2(?,256)")) {

			stmt.setString(1, userId);
			stmt.setString(2, password);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
