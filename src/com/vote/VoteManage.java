package com.vote;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;
import com.model.Vote;

/**
 * Servlet implementation class VoteManage
 */
@WebServlet("/jsp/VoteManage")
public class VoteManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteManage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			Set<Vote> all = DAOFactory.getVoteDadInstance().getAll();
			request.setAttribute("allVote", all);
			RequestDispatcher rd = request.getRequestDispatcher("vote_manage.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String[] themeIds = request.getParameterValues("themeId");
		try {
			Set<Vote> all = DAOFactory.getVoteDadInstance().getAll();
			if(all == null)
				response.sendRedirect("GetAllVote");
			Map<String, Vote> map = new HashMap<String, Vote>();
			for(Vote vote: all) {
				map.put(vote.getId(), vote);
			}
			if(themeIds != null) {
				for(String eachThemeId : themeIds) {
					if(eachThemeId != null) {
						DAOFactory.getVoteDadInstance().startVoteById(eachThemeId);
						map.remove(eachThemeId);
					}
				}
			}
			for(String eachThemeId : map.keySet()) {
				DAOFactory.getVoteDadInstance().stopVoteById(eachThemeId);
			}
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
		response.sendRedirect("GetAllVote");
	}

}
