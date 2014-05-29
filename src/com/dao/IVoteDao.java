package com.dao;

import java.util.Set;

import com.model.Vote;


public interface IVoteDao {
	public String doCreateTheme(String theme) throws Exception;
	public boolean doAddSelectItem(String themeId, String item) throws Exception;
	public Set<Vote> find(String key) throws Exception;
	public Set<Vote> getAll() throws Exception;
	public boolean deleteById(String id) throws Exception;
	public boolean startVoteById(String id) throws Exception;
	public boolean stopVoteById(String id) throws Exception;
	public boolean CountAddByItemId(String id) throws Exception;
	public boolean TotalAddByThemeId(String id) throws Exception;
	public Vote getVoteById(String themeId) throws Exception;
}
