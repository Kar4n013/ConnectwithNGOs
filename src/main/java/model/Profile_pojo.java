package model;

import java.sql.*;
import db_config.GetConnection;

public class Profile_pojo {
    private String portId;
    private String password;
    private String location;
    private String name;
    private String email;

    // Getters and Setters
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

    // Fetch profile from DB
    public static Profile_pojo getProfile(String portId) {
        Profile_pojo profile = null;
        String query = "SELECT * FROM users WHERE port_id = ?";

        try (Connection con = GetConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, portId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                profile = new Profile_pojo();
                profile.setPortId(rs.getString("port_id"));
                profile.setPassword(rs.getString("password"));
                profile.setName(rs.getString("name"));
                profile.setLocation(rs.getString("location"));
                profile.setEmail(rs.getString("email"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profile;
    }

    // Update profile in DB
    public static boolean updateProfile(String portId, String name, String location, String email) {
        String query = "UPDATE users SET name = ?, location = ?, email = ? WHERE port_id = ?";
        try (Connection con = GetConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, name);
            ps.setString(2, location);
            ps.setString(3, email);
            ps.setString(4, portId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete profile
    public static boolean deleteProfile(String portId) {
        String query = "DELETE FROM users WHERE port_id = ?";
        try (Connection con = GetConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, portId);
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Verify current password before updating
    public static boolean verifyPassword(String portId, String currentPassword) {
        String query = "SELECT password FROM users WHERE port_id = ?";
        try (Connection con = GetConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, portId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");
                return storedPassword.equals(currentPassword);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Update password
    public static boolean updatePassword(String portId, String newPassword) {
        String query = "UPDATE users SET password = ? WHERE port_id = ?";
        try (Connection con = GetConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, newPassword);
            ps.setString(2, portId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
