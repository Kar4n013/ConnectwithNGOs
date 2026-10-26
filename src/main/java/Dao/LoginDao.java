package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db_config.GetConnection;
import model.User_pojo;

public class LoginDao {
	public static User_pojo login(String userId, String password, String dept) {
		String input;
		if (userId.contains("com")) {
			input = "email";
		} else {
			input = "phone";
		}
		System.out.println(userId+input+password+dept);

		try (
				PreparedStatement stmt = GetConnection.getConnection().prepareStatement(
						"SELECT * FROM " + dept + "_box WHERE " + input + " = ? AND password = SHA2(?,256)")) {

			stmt.setString(1, userId);
			stmt.setString(2, password);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					UserDao dao = new UserDao();
					System.out.println("got userdao");
					return dao.userdetails(rs.getString("email"),dept);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
