package com.elearning.entity;

public class Student {
	
	private String ID;
	private String password;
	private String name;
	private String image;
	private String preferences;
	
	public String getID() {
		return ID;
	}
	
	public void setID(String ID) {
		this.ID = ID;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getPreferences() {
		return preferences;
	}
	
	public void setPreferences(String preferences) {
		this.preferences = preferences;
	}
}
