package com.PersonalFinance.startup;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpServlet;


public class StartDB extends HttpServlet {
	public static String DBClustername;
	public static String DBIP;
	public static String DBLocation;
	public static String DBName;
	public static String DBPass;
	public static String DBPort;
	public static String DBStatus;
	public static String DBUsername;

	/**
	 * This function will also be called from Install.java
	 *
	 * start = true - Start DB if turned off. start = false - Check status but
	 * don't start if turned off
	 *
	 */
	public static void checkstartDB(boolean start) {
		System.out.print("DBConfig file: ");
		try {
			// Create a file in the running directory
			File f = new File("dbconfigpf.txt");
			if (f.exists() && !f.isDirectory()) {
				BufferedReader br = new BufferedReader(new FileReader("dbconfigpf.txt"));
				try {
					String line = br.readLine();

					for (int i = 0; line != null; i++) {
						if (i == 0) {// First line is DB Location
							DBLocation = line;
						}
						if (i == 1) {
							DBClustername = line;
						}
						if (i == 2) {
							DBName = line;
						}
						if (i == 3) {
							DBUsername = line;
						}
						if (i == 4) {
							DBPass = line;
						}
						if (i == 5) {
							DBIP = line;
						}
						if (i == 6) {
							DBPort = line;
						}
						line = br.readLine();
					}
					if (DBName == null || DBClustername == null || DBLocation == null || DBUsername == null
							|| DBPass == null || DBIP == null || DBPort == null) {
						System.out.println("File Currepted");
					} else {
						System.out.println("Success");
					}
				} finally {
					br.close();
				}
			} else {
				DBStatus = "No Database config file found.";
				System.out.println("No Database config file found.");
			}

			// Check Connection Status
			Class.forName("org.postgresql.Driver");
			Connection connection = DriverManager.getConnection(
					"jdbc:postgresql://" + StartDB.DBIP + ":" + StartDB.DBPort + "/" + StartDB.DBName,
					StartDB.DBUsername, StartDB.DBPass);
			System.out.print("DB Status: ");
			if (connection != null) {
				System.out.println("Success");
				DBStatus = "DB Running";
				connection.close();
			} else {
				System.out.println("Failed");
				DBStatus = "DB Connection Failed";
			}

		} catch (Exception e) {

			System.out.println("Exception occured");

			DBStatus = "DB Connection Failed";
			if (e.getMessage().contains("Check that the hostname and port are correct")) {
				if (start) {
					System.out.println("Starting Database ... \n");
					startDatabase();
				} else {
					DBStatus = "Check that the hostname and port are correct";
					System.out.println("Check that the hostname and port are correct");
				}

			} else {
				e.printStackTrace();
				System.out.println(e.getMessage());
				DBStatus = e.getMessage();
			}
			return;
		}
	}

	/**
	 * @param command
	 *            - to be executed in terminal
	 * @return the output of execution
	 */
	private static String executeCommand(String command) {
		StringBuffer output = new StringBuffer();

		try {
			Process p = Runtime.getRuntime().exec(command);
			p.waitFor();
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String line = "";
			if ((line = reader.readLine()) != null) {
				output.append(line + "\n");
			}
			p.destroyForcibly();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return output.toString();
	}

	/**
	 * After populating the parameters. This function will be called to start
	 * database.
	 */
	private static void startDatabase() {
		// TODO Auto-generated method stub
		System.out.print("Starting DB :");

		System.out.println(
				"\"" + DBLocation + "/bin/pg_ctl\"  -D \"" + DBLocation + "/" + DBClustername + "\" -l logfile start");

		String output = executeCommand(
				"\"" + DBLocation + "/bin/pg_ctl\" -D \"" + DBLocation + "/" + DBClustername + "\" -l logfile start");
		if (output.equals("server starting")) {
			DBStatus = "DB Running";
		}
	}
}