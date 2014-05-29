package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.dao.IVoteDao;
import com.model.Item;
import com.model.Vote;
import com.util.RandomID;

public class VoteDao implements IVoteDao{
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public VoteDao(Connection conn) {
		this.conn = conn;
	}

	@Override
	public String doCreateTheme(String theme) throws Exception {
		String result = null;
		String sql = "insert into selectTheme(id, theme) values (?, ?)";
		this.pstmt = this.conn.prepareStatement(sql);
		result = RandomID.get32ID();
		this.pstmt.setString(1, result);
		this.pstmt.setString(2, theme);
		if(this.pstmt.executeUpdate() > 0) {
			this.pstmt.close();
			return result;
		}
		this.pstmt.close();
		return null;
	}

	@Override
	public boolean doAddSelectItem(String themeId, String item)
			throws Exception {
		boolean result = false;
		String sql = "insert into selectItem(id, themeid, item) values (?, ?, ?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, RandomID.get32ID());
		this.pstmt.setString(2, themeId);
		this.pstmt.setString(3, item);
		if(this.pstmt.executeUpdate() > 0) {
			result = true;
		}
		this.pstmt.close();
		return result;
	}

	@Override
	public Set<Vote> find(String key) throws Exception {
		Map<String, Vote> all = new HashMap<String, Vote>();
		String sql = "select * from v_allVote where theme like ?" ;
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + key + "%");
		ResultSet rs = this.pstmt.executeQuery();
		Vote vote = null;
		while(rs.next()) {
			String voteId = rs.getString("theme_id");
			if(all.containsKey(voteId)) {
				vote = all.get(voteId);
			}else {
				vote = new Vote(rs.getString("theme_id"), rs.getString("theme"), rs.getInt("total"), rs.getInt("status"));
				all.put(voteId, vote);
			}
			vote.addSelectItem(new Item(rs.getString("item_id"), rs.getString("item"), Integer.parseInt(rs.getString("count"))));
		}
		this.pstmt.close();
		return new HashSet<Vote>(all.values());
	}

	@Override
	public Set<Vote> getAll() throws Exception {
		Map<String, Vote> all = new HashMap<String, Vote>();
		String sql = "select * from v_allVote" ;
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		Vote vote = null;
		while(rs.next()) {
			String voteId = rs.getString("theme_id");
			if(all.containsKey(voteId)) {
				vote = all.get(voteId);
			}else {
				vote = new Vote(rs.getString("theme_id"), rs.getString("theme"), rs.getInt("total"), rs.getInt("status"));
				all.put(voteId, vote);
			}
			vote.addSelectItem(new Item(rs.getString("item_id"), rs.getString("item"), Integer.parseInt(rs.getString("count"))));
		}
		this.pstmt.close();
		return new HashSet<Vote>(all.values());
	}

	@Override
	public boolean deleteById(String id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean CountAddByItemId(String id) throws Exception {
		boolean result = false;
		String sql = "update selectItem set count = count + 1 where id = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, id);
		if(this.pstmt.executeUpdate() > 0) {
			result = true;
		}
		this.pstmt.close();
		return result;
	}

	@Override
	public boolean TotalAddByThemeId(String id) throws Exception {
		boolean result = false;
		String sql = "update selectTheme set total = total + 1 where id = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, id);
		if(this.pstmt.executeUpdate() > 0) {
			result = true;
		}
		this.pstmt.close();
		return result;
	}

	@Override
	public Vote getVoteById(String themeId) throws Exception {
		String sql = "select * from v_allVote where theme_id = ?" ;
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, themeId);
		ResultSet rs = this.pstmt.executeQuery();
		Vote vote = null;
		while(rs.next()) {
			if(vote == null) {
				vote = new Vote(rs.getString("theme_id"), rs.getString("theme"), rs.getInt("total"), rs.getInt("status"));
			}
			vote.addSelectItem(new Item(rs.getString("item_id"), rs.getString("item"), Integer.parseInt(rs.getString("count"))));
		}
		this.pstmt.close();
		return vote;
	}

	@Override
	public boolean startVoteById(String id) throws Exception {
		boolean result = false;
		String sql = "update selectTheme set status = 0 where id = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, id);
		if(this.pstmt.executeUpdate() > 0) {
			result = true;
		}
		this.pstmt.close();
		return result;
	}

	@Override
	public boolean stopVoteById(String id) throws Exception {
		boolean result = false;
		String sql = "update selectTheme set status = 1 where id = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, id);
		if(this.pstmt.executeUpdate() > 0) {
			result = true;
		}
		this.pstmt.close();
		return result;
	}
	
	

}
