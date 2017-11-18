package com.PersonalFinance.Auth;

import javax.servlet.http.HttpSession;

public class ValidateSession {

	public static boolean validate(HttpSession session) {
		if(session.getAttribute("Auth") == null){
			return false;
		}else{
			return true;
		}
	}

}
