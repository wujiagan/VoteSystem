package com.dao.proxy;

import java.util.List;

import com.dao.IUserDao;
import com.dao.impl.UserDao;
import com.dbc.DatabaseConnection;
import com.model.User;

public class UserDaoProxy implements IUserDao {

	private DatabaseConnection dbc = null;
	private IUserDao dao = null;
	
	public UserDaoProxy() {
		try {
			this.dbc = new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.dao = new UserDao(this.dbc.getConnection());
	}
	
	@Override
	public boolean doCreate(User user) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doCreate(user);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public User find(String name) throws Exception {
		User user = null;
		try {
			user = this.dao.find(name);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return user;
	}

	@Override
	public List<User> getAll() throws Exception {
		List<User> list = null;
		try {
			list = this.dao.getAll();
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return list;
	}

	@Override
	public boolean deleteByName(String name) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
