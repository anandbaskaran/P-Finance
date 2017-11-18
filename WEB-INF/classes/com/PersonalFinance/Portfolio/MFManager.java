package com.PersonalFinance.Portfolio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PersonalFinance.Auth.ValidateSession;

/**
 * Servlet implementation class MFManager
 */
@WebServlet("/MFManager")
public class MFManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MFManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ValidateSession.validate(request.getSession())){
			request.getRequestDispatcher("/UI/production/personalFinance/MFManager.jsp").forward(request, response);
		}else{
			System.out.println("Invalid Session - MFManager");
			request.getRequestDispatcher("/UI/production/personalFinance/login.html").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ValidateSession.validate(request.getSession())){
			request.getRequestDispatcher("/UI/production/personalFinance/MFManager.jsp").forward(request, response);
		}else{
			//Invalid session page
		}
	}

}
