package com.PersonalFinance.startup;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PersonalFinance.util.DBOperations;


/**
 * Servlet implementation class Install
 */
@WebServlet("/Install")
public class Install extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Install() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Sample dbconfigpf.txt
				// -------------------------------------------------------------
				// Line 1 - Path/to/PSQL directory
				// Line 2 - DB Cluster Name
				// Line 3 - DB Name
				// Line 4 - Username
				// Line 5 - Password
				// Line 6 - IP of DB Server
				// Line 7 - Port of DB server
				// Read this file and populate the request
				File f = new File("dbconfigpf.txt");
				if (f.exists() && !f.isDirectory()) {
					BufferedReader br = new BufferedReader(new FileReader("dbconfigpf.txt"));
					try {
						new StringBuilder();
						String line = br.readLine();

						for (int i = 0; line != null; i++) {
							if (i == 0) {// First line is DB Location3
								StartDB.DBLocation = line;
								if (line == "null") {
									StartDB.DBLocation = null;
								}
								request.setAttribute("DBLocation", StartDB.DBLocation);
							}
							if (i == 1) {
								StartDB.DBClustername = line;
								if (line == "null") {
									StartDB.DBClustername = null;
								}
								request.setAttribute("DBClustername", StartDB.DBClustername);
							}
							if (i == 2) {
								StartDB.DBName = line;
								if (line == "null") {
									StartDB.DBName = null;
								}
								request.setAttribute("DBName", StartDB.DBName);
							}
							if (i == 3) {
								StartDB.DBUsername = line;
								if (line == "null") {
									StartDB.DBUsername = null;
								}
								request.setAttribute("DBUsername", StartDB.DBUsername);
							}
							if (i == 4) {
								StartDB.DBPass = line;
								if (line == "null") {
									StartDB.DBPass = null;
								}
								request.setAttribute("DBPass", StartDB.DBPass);
							}
							if (i == 5) {
								StartDB.DBIP = line;
								if (line == "null") {
									StartDB.DBIP = "127.0.0.1";
								}
								request.setAttribute("DBIP", StartDB.DBIP);
							}
							if (i == 6) {
								StartDB.DBPort = line;
								if (line == "null") {
									StartDB.DBPort = "5432";
								}
								request.setAttribute("DBPort", StartDB.DBPort);
							}
							line = br.readLine();
						}
						if (StartDB.DBName == null || StartDB.DBLocation == null || StartDB.DBUsername == null
								|| StartDB.DBPass == null) {

							System.out.println("File Currepted");

						}

					} finally {
						br.close();
					}
				} else {
					// Reset all the parameters if no file found
					System.out.println("DB Configuration file not found");
					request.setAttribute("DBPort", "");
					request.setAttribute("DBIP", "");
					request.setAttribute("DBPass", "");
					request.setAttribute("DBUsername", "");
					request.setAttribute("DBName", "");
					request.setAttribute("DBClustername", "");
					request.setAttribute("DBLocation", "");

				}

				if (request.getParameter("DBAction") != null) {
					if (request.getParameter("DBAction").equals("check")) {
						StartDB.checkstartDB(false);// Just check DB
					} else if (request.getParameter("DBAction").equals("start")) {
						StartDB.checkstartDB(true); // Check DB and start if not running
					} else if (request.getParameter("DBAction").equals("initialize")) {
						initializeDB(); // Initialize the DB
					}
				}

				request.setAttribute("DBStatus", StartDB.DBStatus);
				request.getRequestDispatcher("/UI/production/personalFinance/installDB.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Save the data into the the file and populate it in GET
				if (request.getParameter("DBAction").equals("save")) {
					PrintWriter writer = new PrintWriter("dbconfigpf.txt", "UTF-8");
					writer.println(request.getParameter("DBLocation"));
					writer.println(request.getParameter("DBClustername"));
					writer.println(request.getParameter("DBName"));
					writer.println(request.getParameter("DBUsername"));
					writer.println(request.getParameter("DBPass"));
					if (request.getParameter("DBIP") == "") {
						writer.println("127.0.0.1");
					} else {
						writer.println(request.getParameter("DBIP"));
					}
					if (request.getParameter("DBPort") == "") {
						writer.println("5432");
					} else {
						writer.println(request.getParameter("DBPort"));
					}

					writer.close();
				}
				doGet(request, response);
	}
	/**
	 * Will do execution of all the commands in DBCreator.txt in DB
	 */
	private void initializeDB() {
		try {
			InputStream input = this.getClass().getResourceAsStream("DBCreator.txt");
			BufferedReader br = new BufferedReader(new InputStreamReader(input));
			try {
				StringBuilder sb = new StringBuilder();
				String line = br.readLine();
				while (line != null) {
					sb = new StringBuilder();
					do {
						sb.append(line);
						line = br.readLine();
					} while (!line.contains(";"));
					sb.append(line); // Append the line containing;
					DBOperations.executeUpdate(sb.toString());
					line = br.readLine();
				}
			} finally {
				System.out.println("Initialized successfully");
				br.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
