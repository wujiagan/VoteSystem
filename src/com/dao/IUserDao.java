package com.dao;

import java.util.List;

import com.model.User;

public interface IUserDao {
	public boolean doCreate(User user) throws Exception;
	public User find(String name) throws Exception;
	public List<User> getAll() throws Exception;
	public boolean deleteByName(String name) throws Exception;
}
