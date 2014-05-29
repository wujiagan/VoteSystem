package com.factory;

import com.dao.IUserDao;
import com.dao.IVoteDao;
import com.dao.proxy.UserDaoProxy;
import com.dao.proxy.VoteDaoProxy;

public class DAOFactory {
	private static IVoteDao voteDao = null;
	public static IUserDao getDAOInstance() throws Exception {
		return new UserDaoProxy();
	}
	public static IVoteDao getVoteDadInstance() throws Exception {
		return new VoteDaoProxy();
	}
}
