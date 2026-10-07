package model;

public class User_pojo {
	final private int id;
	final private String username;
	final private String phone;
	final private String email;
	final private String address;
	
	public String getAddress() {
		return address;
	}
	final private String role;
	
	public User_pojo(int id, String username, String phone, String email,String address, String role) {
		
		this.id = id;
		this.username = username;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.role = role;
	}
	
	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getNumber() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getRole() {
		return role;
	}

}
