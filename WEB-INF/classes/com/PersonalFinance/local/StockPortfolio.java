package com.PersonalFinance.local;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.PersonalFinance.util.DBOperations;

public class StockPortfolio extends Portfolio implements FinCalc{

	public StockPortfolio(int _userId) {
		super(_userId);
	}

	public static JSONObject getAllAccounts() {
		JSONObject portfolio_stock = new JSONObject();
		try {
			String sql = "select * from portfolio_stocks";
			JSONArray portfolio_stock_json = DBOperations.selectMultiple(sql);
			double totalInv = 0;
			double presentVal = 0;
			System.out.println("Stock Inv = "+ portfolio_stock_json );
			for (int i = 0; i < portfolio_stock_json.size(); i++) {
				JSONObject company = (JSONObject) portfolio_stock_json.get(i);
				totalInv +=  (double)(company).get("BuyValue");
				presentVal +=  (double)(company).get("PresentValue");
			}
			portfolio_stock.put("totalInv", totalInv);
			portfolio_stock.put("presentVal", presentVal);
			portfolio_stock.put("portfolio", portfolio_stock_json);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return portfolio_stock;
	}

}
