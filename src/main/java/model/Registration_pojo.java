package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db_config.GetConnection;

public class Registration_pojo {
    private String portId;
    private String password;
    private String location;
    private String name;
    private String email;

    // --- Getters and Setters ---
    public String getPortId() { return portId; }
    public void setPortId(String portId) { this.portId = portId; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    // --- Check if Port ID or Email is unique ---
    public boolean isUnique() {
        try (Connection con = GetConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM Users WHERE PORT_ID = ? OR EMAIL = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, portId);
                ps.setString(2, email);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt(1) == 0; // true if no duplicate
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // default if error
    }

    // --- Register User ---
    public boolean registerUser() {
        if (!isUnique()) {
            return false; // already exists
        }
        try (Connection con = GetConnection.getConnection()) {
            String sql = "INSERT INTO Users (PORT_ID, PASSWORD, LOCATION, NAME, EMAIL) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, portId);
                ps.setString(2, password);
                ps.setString(3, location);
                ps.setString(4, name);
                ps.setString(5, email);

                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
