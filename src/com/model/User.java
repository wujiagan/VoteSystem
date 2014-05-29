package com.model;

public class User {
	private String name;
	private String pass;
	private int role;
	
	/**
	 * 普通用户
	 */
	private final static int GENERAL = 0;
	
	/**
	 * 管理员
	 */
	private final static int ADMIN = 1;
	
	public User(){}

	public User(String name, String pass) {
		this.name = name;
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
	public static boolean isAdmin(User user) {
		return user.role == ADMIN;
	}

	@Override
	public int hashCode() {
		return this.name.hashCode();
	}

	@Override
	public boolean equals(Object anObject) {
		if (this == anObject) {
            return true;
        }
        if (anObject instanceof User) {
        	User anotherUser = (User) anObject;
        	return this.name.equals(anotherUser.getName());
        }
        return false;
	}

	@Override
	public String toString() {
		return this.name;
	}
	
	
	
}
