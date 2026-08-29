package model;

import db_config.GetConnection;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Product_pojo {
	private int product_id, quantity, price;
	private String seller_port_id, product_name, description;
	private Timestamp created_at, updated_at;

	public String getSeller_port_id() {
		return seller_port_id;
	}

	public void setSeller_port_id(String seller_port_id) {
		this.seller_port_id = seller_port_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Timestamp getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public void insert() throws Exception {
		PreparedStatement preparedStatement = GetConnection.getConnection().prepareStatement(
				"insert into product(seller_port_id,product_name,description,quantity,price) values (?,?,?,?,?)");
		preparedStatement.setString(1, seller_port_id);
		preparedStatement.setString(2, product_name);
		preparedStatement.setString(3, description);
		preparedStatement.setInt(4, quantity);
		preparedStatement.setInt(5, price);
		preparedStatement.executeUpdate();
		
		GetConnection.getConnection().close();
	}

	public boolean preupdate() throws Exception {
		String sql = "SELECT product_name, description, quantity, price, created_at, updated_at "
				+ "FROM product WHERE product_id = ?";

		try (PreparedStatement preparedStatement = GetConnection.getConnection().prepareStatement(sql)) {
			preparedStatement.setInt(1, product_id);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {

				if (resultSet.next()) { // ✅ Move to first row
					setProduct_id(product_id);
					setProduct_name(resultSet.getString("product_name"));
					setDescription(resultSet.getString("description"));
					setPrice(resultSet.getInt("price")); 
					setQuantity(resultSet.getInt("quantity"));
					setCreated_at(resultSet.getTimestamp("created_at"));
					setUpdated_at(resultSet.getTimestamp("updated_at"));
					return true;
				} else {
					return false; // No product found
				}
			}
		}
	}

	public void update() throws Exception {

		PreparedStatement preparedStatement = GetConnection.getConnection().prepareStatement(
				"update product set product_name = ?,description = ?,quantity=?,price=?,updated_at = current_timestamp where product_id = ?");
		preparedStatement.setString(1, product_name);
		preparedStatement.setString(2, description);
		preparedStatement.setInt(3, quantity);
		preparedStatement.setInt(4, price);
		preparedStatement.setInt(5, product_id);
		preparedStatement.executeUpdate();
		
		GetConnection.getConnection().close();
	}

	public void delete() throws Exception {
		PreparedStatement preparedStatement = GetConnection.getConnection()
				.prepareStatement("delete from product where product_id = ?");
		preparedStatement.setInt(1, product_id);
		preparedStatement.executeUpdate();
		
		GetConnection.getConnection().close();
	}

	public Product_pojo(int product_id, String seller_port_id, String product_name, String description, int quantity,
			int price, Timestamp created_at, Timestamp updated_at) {
		this.product_id = product_id;
		this.seller_port_id = seller_port_id;
		this.product_name = product_name;
		this.description = description;
		this.quantity = quantity;
		this.price = price;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}

	public Product_pojo() {
	}

	public List<Product_pojo> show(String seller_port_id) throws SQLException {
		List<Product_pojo> product = new ArrayList<>();

		PreparedStatement preparedStatement = GetConnection.getConnection()
				.prepareStatement("select * from product where seller_port_id = ?");
		preparedStatement.setString(1, seller_port_id);
		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			product.add(new Product_pojo(resultSet.getInt("product_id"), resultSet.getString("seller_port_id"),
					resultSet.getString("product_name"), resultSet.getString("description"),
					resultSet.getInt("quantity"), resultSet.getInt("price"), resultSet.getTimestamp("created_at"),
					resultSet.getTimestamp("updated_at")));
		}
		
		GetConnection.getConnection().close();

		return product;
	}

	public boolean verify() throws Exception {
		PreparedStatement preparedStatement = GetConnection.getConnection()
				.prepareStatement("SELECT COUNT(*) FROM product WHERE product_id = ? AND seller_port_id = ?");
		preparedStatement.setInt(1, product_id);
		preparedStatement.setString(2, seller_port_id);
		ResultSet result = preparedStatement.executeQuery();
		result.next();
		int count = result.getInt(1);
		GetConnection.getConnection().close();
		if (count > 0) {
			
			return true;
		} else {
			return false;
		}

	}

}
