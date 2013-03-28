package com.ymxx.jweb.action.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ymxx.jweb.persistence.account.User;
import com.ymxx.jweb.service.security.AccountService;

public class UserAccessAction extends HttpServlet{

	private AccountService accountService = new AccountService();
	
	private static final long serialVersionUID = 1879758574438473553L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.setContentType("application/json");
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		Boolean isGood = accountService.checkUser(username,password);
		if(isGood){
			System.out.println("登录成功");
			req.getSession().setAttribute("username", new User(username,password));
			resp.getWriter().write("{\"msg\":\"success\"}");
		}else{
			
			System.out.println("登录失败");
			req.getSession().setAttribute("username", new User("",""));
			resp.getWriter().write("{\"msg\":\"fail\"}");
		}
		User user = (User)req.getSession().getAttribute("username");
		System.out.println(user.toString());
	}

	
}
