package com.PersonalFinance.local;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.json.simple.JSONObject;

import com.PersonalFinance.local.FinCalc.AccountStatement;
import com.PersonalFinance.util.util;

public class BankAccount {
	private enum BankName {
		HDFC, IndBank
	}
	private enum AccountType {
		RD, FD
	}
	private long accountNumber;
	private AccountType type;
	private double interestRate;
	private Date start_date;
	private Date end_date;
	private double principle;
	private double maturity;
	private BankName bankName;
	private float progress;
	private float cuttentAmount;
	public BankAccount(JSONObject bank_account) {
		accountNumber = (long) bank_account.get("account_number");
		type = AccountType.valueOf(removeWhiteSpase((String) bank_account.get("type")));
		interestRate = (double) bank_account.get("interest_rate");
		start_date = string2Date((String) bank_account.get("start_date"));
		end_date = string2Date((String) bank_account.get("end_date"));
		principle = util.value2double(bank_account.get("amount"));
		maturity = util.value2double(bank_account.get("maturity_amount"));
		bankName =  BankName.valueOf(removeWhiteSpase((String) bank_account.get("bank_name")));
		progress = getProgress();
		cuttentAmount = (float) (maturity*progress/100);
	}
	
	private float getProgress() {
		long totalDays = TimeUnit.DAYS.convert(end_date.getTime() - start_date.getTime(), TimeUnit.MILLISECONDS);
		Date today = new Date();
		long currentDays = TimeUnit.DAYS.convert(end_date.getTime() - today.getTime(), TimeUnit.MILLISECONDS);
		return ((float)currentDays*100)/((float)totalDays);
	}

	private Date string2Date(String dateString) {
		try {
			return new SimpleDateFormat("yyyy-mm-dd").parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return end_date;  
	}
	private String removeWhiteSpase(String string) {
		return string.replaceAll("\\s+", "");
	}

	public double getPrincipleAmount() {
		return this.principle;
	}

	public float gettodayChange() {
		// TODO Auto-generated method stub
		return 0;
	}

	public float getcurrentAmount() {
		//Calculate with quaterly compounding instead of maturity
		return this.cuttentAmount;
	}

	public double getInterest() {
		return this.interestRate;
	}

}
