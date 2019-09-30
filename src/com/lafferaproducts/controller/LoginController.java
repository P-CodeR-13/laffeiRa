package com.lafferaproducts.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lafferaproducts.service.UserService;

public class LoginController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ApplicationContext applicationContextUser = 
				new ClassPathXmlApplicationContext("/com/lafferaproducts/resource/applicationContext.xml");
		
		UserService userService = 
				(UserService) applicationContextUser.getBean("userService");
		String action = request.getParameter("action") == null ? "" : request.getParameter("action");
		String page = "";
		if ("login".equals(action)) {
			if (userService.ifSessionActive(request)) {
				 page = "pages/goHome.jsp"; 
			}else page = "pages/login.jsp";
		}else if ("signUp".equals(action)) {
			page = "pages/signup.jsp";
		}else if("logOut".equals(action)) {
			try {
				userService.logOut(request);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			page = "pages/login.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

}
