package com.ymxx.jweb.service.security;

public class AccountService {

	/**
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public Boolean checkUser(String username, String password) {
		
		if(username == null || password == null){
			
			return false;
		}
		if("张少举".equals(username) && "aimuchun99".equals(password)){
			
			return true;
		}
		return false;
	}

}
