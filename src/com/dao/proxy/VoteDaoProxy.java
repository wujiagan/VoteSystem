package com.dao.proxy;

import java.util.Set;

import com.dao.IVoteDao;
import com.dao.impl.VoteDao;
import com.dbc.DatabaseConnection;
import com.model.Vote;

public class VoteDaoProxy implements IVoteDao{

		
	private DatabaseConnection dbc = null;
	private IVoteDao dao = null;
	
	public VoteDaoProxy() {
		try {
			this.dbc = new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.dao = new VoteDao(this.dbc.getConnection());
	}
	
	@Override
	public String doCreateTheme(String theme) throws Exception {
		String id = null;
		try {
			id = this.dao.doCreateTheme(theme);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return id;
	}

	@Override
	public boolean doAddSelectItem(String themeId, String item)
			throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doAddSelectItem(themeId, item);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public Set<Vote> find(String key) throws Exception {
		Set<Vote> all = null;
		try {
			all = this.dao.find(key);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}

	@Override
	public Set<Vote> getAll() throws Exception {
		Set<Vote> all = null;
		try {
			all = this.dao.getAll();
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}

	@Override
	public boolean deleteById(String id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean CountAddByItemId(String id) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.CountAddByItemId(id);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean TotalAddByThemeId(String id) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.TotalAddByThemeId(id);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public Vote getVoteById(String themeId) throws Exception {
		Vote vote = null;
		try {
			vote = this.dao.getVoteById(themeId);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return vote;
	}

	@Override
	public boolean startVoteById(String id) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.startVoteById(id);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean stopVoteById(String id) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.stopVoteById(id);
		} catch (Exception e) {
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

}
