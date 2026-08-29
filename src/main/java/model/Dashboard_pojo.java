package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db_config.GetConnection;

public class Dashboard_pojo {
    private int productsCount;
    private int ordersCount;
    private int reportedProductsCount;

    
    public int getProductsCount() {
        return productsCount;
    }
    public int getOrdersCount() {
        return ordersCount;
    }
    public int getReportedProductsCount() {
        return reportedProductsCount;
    }

    
    public void loadCounts(String portId) {
        try (Connection con = GetConnection.getConnection()) {

       
            String sqlProducts = "SELECT COUNT(*) FROM product WHERE seller_port_id = ?";
            try (PreparedStatement ps = con.prepareStatement(sqlProducts)) {
                ps.setString(1, portId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) productsCount = rs.getInt(1);
                }
            }

   
            String sqlOrders = "SELECT COUNT(*) FROM orders WHERE seller_port_id = ?";
            try (PreparedStatement ps = con.prepareStatement(sqlOrders)) {
                ps.setString(1, portId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) ordersCount = rs.getInt(1);
                }
            }


            String sqlReported = "SELECT COUNT(*) FROM reported_products";
            try (PreparedStatement ps = con.prepareStatement(sqlReported)) {
               
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) reportedProductsCount = rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
