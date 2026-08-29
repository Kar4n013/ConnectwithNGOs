package model;

import db_config.GetConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Report_pojo {

    private int reportedId;
    private int productId;
    private String reporterId;
    private String reason;
    private Timestamp reportedAt;
    private String status;

   
    public int getReportedId() { return reportedId; }
    public void setReportedId(int reportedId) { this.reportedId = reportedId; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getReporterId() { return reporterId; }
    public void setReporterId(String reporterId) { this.reporterId = reporterId; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    public Timestamp getReportedAt() { return reportedAt; }
    public void setReportedAt(Timestamp reportedAt) { this.reportedAt = reportedAt; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

 
    public static List<Report_pojo> getAllReports() {
        List<Report_pojo> reports = new ArrayList<>();
        String query = "SELECT * FROM reported_products ORDER BY reported_at DESC";

        try (Connection con = GetConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Report_pojo report = new Report_pojo();
                report.setReportedId(rs.getInt("reported_id"));
                report.setProductId(rs.getInt("product_id"));
                report.setReporterId(rs.getString("reporter_id"));
                report.setReason(rs.getString("reason"));
                report.setReportedAt(rs.getTimestamp("reported_at"));
                report.setStatus(rs.getString("status"));
                reports.add(report);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reports;
    }

   
    public static boolean updateStatus(int reportedId, String status) {
        String query = "UPDATE reported_products SET status = ? WHERE reported_id = ?";
        try (Connection con = GetConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, status);
            ps.setInt(2, reportedId);
            int updated = ps.executeUpdate();
            return updated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    }


