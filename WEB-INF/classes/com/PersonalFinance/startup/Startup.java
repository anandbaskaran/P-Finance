package com.PersonalFinance.startup;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.PersonalFinance.local.PFResources;

public class Startup extends HttpServlet{
	public void init() throws ServletException {
		StartDB.checkstartDB(true); // Check status and turn on DB if switched off.
		PFResources.reInit(1);
	}
}
