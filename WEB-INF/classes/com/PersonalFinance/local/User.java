package com.PersonalFinance.local;

public class User {
	private static int userId;
	public User(int _userId){
		userId = _userId;
	}
	public int getUserId(){
		return userId;
	}
	public boolean reInit() {
		boolean status = true;
		return status;
	}
}
