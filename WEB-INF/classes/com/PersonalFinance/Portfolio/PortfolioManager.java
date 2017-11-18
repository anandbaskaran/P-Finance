package com.PersonalFinance.Portfolio;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.PersonalFinance.Auth.ValidateSession;
import com.PersonalFinance.local.BankPortfolio;
import com.PersonalFinance.local.StockPortfolio;
import com.PersonalFinance.util.DBOperations;

/**
 * Servlet implementation class PortfolioManager
 */
@WebServlet("/PortfolioManager")
public class PortfolioManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PortfolioManager() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ValidateSession.validate(request.getSession())) {
			doPost(request, response);
		} else {
			request.getRequestDispatcher("/UI/production/personalFinance/login.html").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ValidateSession.validate(request.getSession())) {
			request.setAttribute("portfolio_bank", BankPortfolio.getAllAccounts());
			request.setAttribute("portfolio_stock", StockPortfolio.getAllAccounts());
			System.out.println("STOCK "+StockPortfolio.getAllAccounts());
			
		} else {
			System.out.println("Invalid Session");
			// Invalid session page
		}
		request.getRequestDispatcher("/UI/production/personalFinance/portfolioManager.jsp").forward(request,
				response);
	}


	private static String format(String pattern, Object value) {
		return new DecimalFormat(pattern).format(value);
	}

}
