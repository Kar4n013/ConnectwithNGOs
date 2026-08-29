package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import db_config.GetConnection;

public class Order_pojo {
    private int orderId;
    private String buyerId;
    private String sellerPortId;
    private Timestamp orderDate;
    private double totalAmount;
    private String status;
    private String deliveryAddress;

    // getters and setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public String getBuyerId() { return buyerId; }
    public void setBuyerId(String buyerId) { this.buyerId = buyerId; }

    public String getSellerPortId() { return sellerPortId; }
    public void setSellerPortId(String sellerPortId) { this.sellerPortId = sellerPortId; }

    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDeliveryAddress() { return deliveryAddress; }
    public void setDeliveryAddress(String deliveryAddress) { this.deliveryAddress = deliveryAddress; }

    // Fetch orders by seller_id
    public static List<Order_pojo> getOrdersBySeller(String sellerId) {
        List<Order_pojo> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE seller_port_id = ?";

        try (Connection con = GetConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order_pojo order = new Order_pojo();
                order.setOrderId(rs.getInt("order_id"));
                order.setBuyerId(rs.getString("buyer_id"));
                order.setSellerPortId(rs.getString("seller_port_id"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setDeliveryAddress(rs.getString("delivery_address"));
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    // Update status by order_id
    public static boolean updateStatus(int orderId, String status) {
        String query = "UPDATE orders SET status = ? WHERE order_id = ?";
        try (Connection con = GetConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, status);
            ps.setInt(2, orderId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

