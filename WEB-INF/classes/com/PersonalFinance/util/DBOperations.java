package com.PersonalFinance.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

import com.PersonalFinance.startup.StartDB;

public class DBOperations {
	public static boolean executeUpdate(String sql) {
		// long startDB = System.nanoTime();
		Connection c = null;
		Statement stmt = null;
		boolean out = false;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection(
					"jdbc:postgresql://" + StartDB.DBIP + ":" + StartDB.DBPort + "/" + StartDB.DBName,
					StartDB.DBUsername, StartDB.DBPass);
			// System.out.println("Opened database successfully");
			stmt = c.createStatement();
			// System.out.println(sql);
			int status = stmt.executeUpdate(sql);

			stmt.close();
			c.close();
			if (status != 0) {
				out = true;
			}

		} catch (Exception e) {
			//DataLoging.logger.severe("Exception in DB Execution: " + e.getMessage());
			//DataLoging.logger.severe("while executing " + sql);
			System.out.println("Exception in DB Execution: " + e.getMessage());
			System.out.println("While executing " + sql);
			return false;
		}
		// long value = System.nanoTime() - startDB;
		// System.out.println(value);
		// DataLoging.testLogger.info("202 " + Long.toString(value));
		return out;

	}

	public static JSONArray selectMultiple(String sql) {
		// long startTime = System.nanoTime();
		Connection c = null;
		Statement stmt = null;
		JSONArray result = null;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection(
					"jdbc:postgresql://" + StartDB.DBIP + ":" + StartDB.DBPort + "/" + StartDB.DBName,
					StartDB.DBUsername, StartDB.DBPass);
			// System.out.println("Opened database successfully");
			stmt = c.createStatement();
			// System.out.println(sql);

			String newSQL = "select array_to_json(array_agg(row_to_json(t))) from (" + sql + ") t";

			ResultSet rs = stmt.executeQuery(newSQL);
			if (rs.next()) {
				JSONParser jsonParser = new JSONParser();
				result = (JSONArray) jsonParser.parse(rs.getString(1));
			}
			rs.close();
			stmt.close();
			c.close();

		} catch (Exception e) {
			//DataLoging.logger.severe("Exception in DB Execution: " + e.getMessage());
			//DataLoging.logger.severe("while executing " + sql);
			System.out.println("Exception in DB Selection: " + e.getMessage());
			System.out.println("While executing " + sql);
			return new JSONArray();
		}
		// DataLoging.testLogger.info("" + (System.nanoTime() - startTime));

		return result;
	}
}
