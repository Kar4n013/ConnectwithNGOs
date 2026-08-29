package model;

import db_config.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User_pojo {
    private String portId;
    private String password;

    public User_pojo() {}

    public User_pojo(String portId, String password) {
        this.portId = portId;
        this.password = password;
    }

    public String getPortId() {
        return portId;
    }

    public void setPortId(String portId) {
        this.portId = portId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // ✅ Business logic inside Model
    public static boolean login(String portId, String password) {
        boolean valid = false;
        try (Connection connection = GetConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(
                     "SELECT 1 FROM users WHERE port_id = ? AND password = ?")) {

            stmt.setString(1, portId);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    valid = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return valid;
    }
}
