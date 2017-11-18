package com.PersonalFinance.local;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.PersonalFinance.util.DBOperations;

public class BankPortfolio extends Portfolio implements FinCalc {
	private volatile static List<BankAccount> bankAccounts = new ArrayList<BankAccount>();
	private float investmentAmount = 0;
	private float currentAmount = 0;
	private float todayChange = 0;
	private float weightedInterst = 0;

	public BankPortfolio(int _userId) {
		super(_userId);
		String sql = "select * from portfolio_bank where user_id=" + _userId;
		JSONArray portfolio_bank_json = DBOperations.selectMultiple(sql);
		BankAccount bankAccount;
		for (int i = 0; i < portfolio_bank_json.size(); i++) {
			bankAccount = new BankAccount((JSONObject) portfolio_bank_json.get(i));
			investmentAmount += bankAccount.getPrincipleAmount();
			currentAmount += bankAccount.getcurrentAmount();
			todayChange += bankAccount.gettodayChange();
			weightedInterst += bankAccount.getPrincipleAmount() * bankAccount.getInterest();
			bankAccounts.add(bankAccount);
		}
		weightedInterst /= investmentAmount;
		System.out.println("Total Bank Investment= " + investmentAmount);
		System.out.println("Total Bank currentAmount= " + currentAmount);
		System.out.println("Total Bank weightedInterst= " + weightedInterst);
	}

	public static JSONObject getAllAccounts() {
		JSONObject portfolio_bank = new JSONObject();
		try {
			String sql = "select * from portfolio_bank";
			JSONArray portfolio_bank_json = DBOperations.selectMultiple(sql);
			long total = 0;
			for (int i = 0; i < portfolio_bank_json.size(); i++) {
				JSONObject account = (JSONObject) portfolio_bank_json.get(i);
				total += (long) (account).get("maturity_amount");
				account.put("interest_rate", (double) Math.round((double) account.get("interest_rate") * 100) / 100);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-mm-dd");
				Date endDate = dateFormatter.parse((String) account.get("end_date"));
				Date startDate = dateFormatter.parse((String) account.get("start_date"));
				long durationDays = Math.abs((endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000));
				account.put("durationDays", durationDays);
			}
			portfolio_bank.put("total", total);
			portfolio_bank.put("portfolio", portfolio_bank_json);
			System.out.println(portfolio_bank.toJSONString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return portfolio_bank;

	}

}
