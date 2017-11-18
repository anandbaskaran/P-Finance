package com.PersonalFinance.Auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.PersonalFinance.util.DBOperations;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (!ValidateSession.validate(session)) {//Invalid session
			request.getRequestDispatcher("/UI/production/personalFinance/login.html").forward(request, response);

		} else {

			// If session already exists check and validate
			doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Check auth
		HttpSession session = request.getSession();
		if (session.getAttribute("Auth") == null) {
			String email = request.getParameter("email");
			String password = request.getParameter("pass");
			
			String sql = "SELECT * FROM USERS WHERE " + "EMAIL =\'" + email + "\' AND PASS=\'" + password + "\'";
			JSONArray AuthUsers = DBOperations.selectMultiple(sql);
			if(AuthUsers.isEmpty()){
				//Auth failed
			}else{
				session.setAttribute("Auth", true);
				session.setAttribute("name", ((JSONObject)AuthUsers.get(0)).get("name"));
				session.setAttribute("userid", ((JSONObject)AuthUsers.get(0)).get("id"));
				request.getRequestDispatcher("/UI/production/personalFinance/index.jsp").forward(request, response);
			}
		} else {
			// If session already exists check and validate
			if(ValidateSession.validate(session)){
				request.getRequestDispatcher("/UI/production/personalFinance/index.jsp").forward(request, response);
			}else{
				//Invalid session page
			}
		}
		
	}

}
