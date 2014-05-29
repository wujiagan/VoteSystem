package com.vote;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;

/**
 * Servlet implementation class UpdateVote
 */
@WebServlet("/jsp/UpdateVote")
public class UpdateVote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String themeId = request.getParameter("themeId");
		String[] itemIds = request.getParameterValues("item");
		try {
			if(DAOFactory.getVoteDadInstance().TotalAddByThemeId(themeId)) {
				if(itemIds != null) {
					for(String eachItemId : itemIds) {
						if(eachItemId != null)
							DAOFactory.getVoteDadInstance().CountAddByItemId(eachItemId);
					}
				}
			}
			else {
				response.sendRedirect("error.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
		response.sendRedirect("GetAllVote");
	}

}
