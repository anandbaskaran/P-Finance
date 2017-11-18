package com.PersonalFinance.Auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PersonalFinance.util.DBOperations;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at GET: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("pass2");
		String agree = request.getParameter("agree");
		String message = "";
		System.out.println("Post Register");
		boolean noerror = true;
		if (!name.equals("null")) {
			message += "Name cannot be null. <br>";
			noerror = false;
		}
		if (!isValidEmailAddress(email)) {
			message += "Invalid E-Mail.<br>";
			noerror = false;
		}
		if (pass.length() < 5 && !pass.equals("null")) {
			message += "Password should be atleast of 5 characters.<br>";
			noerror = false;
		}
		if (!pass.equals(pass2)) {
			message += "Password does not match.<br>";
			noerror = false;
		}
		
		if (noerror) {
			try {
				String sql = "INSERT INTO USERS (NAME,EMAIL,PASS) " + "VALUES (\'" + name + "\',\'" + email + "\',\'"
						+ pass + "\' );";
				System.out.println(sql);
				boolean statusOwners = DBOperations.executeUpdate(sql);
				
				
				if (statusOwners) {
					request.setAttribute("messageType", "successAlert");
					request.setAttribute("messageHead", "Account Created successfully");
					System.out.println("Account Created successfully");
					HttpSession session = request.getSession();
					session.setAttribute("Auth", "reg");
					session.setAttribute("email", email);
					
					response.sendRedirect("AdminLogin");
					//request.getRequestDispatcher("AdminLogin").forward(request, response);
				} else{
					request.setAttribute("messageType", "severeAlert");
					request.setAttribute("messageHead", "Account Creation failed");
					request.setAttribute("message", "Owner Account creation failed");
					System.out.println("Failed1");
					request.getRequestDispatcher("/console/pages/examples/register.jsp").forward(request, response);
				} 

			} catch (Exception e) {
				request.setAttribute("messageType", "infoAlert");
				request.setAttribute("messageHead", "Account Creation failed");
				request.setAttribute("message", e.getMessage());
				System.out.println("Failed2");
				request.getRequestDispatcher("/console/pages/examples/register.jsp").forward(request, response);
			}
		} else {
			if (!name.equals("null")) {
				request.setAttribute("name", name);
			} else {
				request.setAttribute("name", "");
			}
			if (!email.equals("null")) {
				request.setAttribute("email", email);
			} else {
				request.setAttribute("email", "");
			}
			if (!pass.equals("null")) {
				request.setAttribute("pass", pass);
			} else {
				request.setAttribute("pass", "");
			}
			request.setAttribute("pass2", "");

			request.setAttribute("messageType", "warningAlert");
			request.setAttribute("messageHead", "Account not created");
			request.setAttribute("message", message);
			request.getRequestDispatcher("/console/pages/examples/register.jsp").forward(request, response);
		}
	}
	
	private boolean isValidEmailAddress(String email) {
		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);
		return m.matches();
	}

}
