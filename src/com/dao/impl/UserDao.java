package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import com.dao.IUserDao;
import com.model.User;

public class UserDao implements IUserDao{

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public boolean doCreate(User user) throws Exception {
		boolean result = false;
		String sql = "insert into users values (?, ?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, user.getName());
		this.pstmt.setString(2, user.getPass());
		if(this.pstmt.executeUpdate() > 0) {
			result = true;
		}
		this.pstmt.close();
		return result;
	}

	@Override
	public User find(String name) throws Exception {
		String sql = "select * from users where name = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, name);
		ResultSet rs = this.pstmt.executeQuery();
		User user = null;
		while(rs.next()) {
			user = new User();
			user.setName(rs.getString("name"));
			user.setPass(rs.getString("pass"));
			
		}
		this.pstmt.close();
		return user;
	}

	@Override
	public List<User> getAll() throws Exception {
		String sql = "select * from users";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		List<User> list = new LinkedList<User>();
		User user = null;
		while(rs.next()) {
			user = new User();
			user.setName(rs.getString("name"));
			user.setPass(rs.getString("pass"));
			list.add(user);
		}
		this.pstmt.close();
		return list;
	}

	@Override
	public boolean deleteByName(String name) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}



}
