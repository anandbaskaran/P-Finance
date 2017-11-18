package com.PersonalFinance.local;

public class Person {
	private static int userId;
	private static BankPortfolio bankPortfolio;
	private static MutualPortfolio mutualPortfolio;
	private static StockPortfolio stockPortfolio;
	public Person(int _userId) {
		userId=_userId;
		bankPortfolio = new BankPortfolio(userId);
		mutualPortfolio = new MutualPortfolio(userId);
		stockPortfolio = new StockPortfolio(userId);
	}
	public int getUserId(){
		return userId;
	}

}
