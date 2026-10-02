package model;

public class User_pojo {
	final private int id;
	final private String username;
	final private String number;
	final private String email;
	final private String role;
	
	
	
	public User_pojo(int id, String username, String number, String email, String role) {
		super();
		this.id = id;
		this.username = username;
		this.number = number;
		this.email = email;
		this.role = role;
	}
	
	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getNumber() {
		return number;
	}
	public String getEmail() {
		return email;
	}
	public String getRole() {
		return role;
	}

}
