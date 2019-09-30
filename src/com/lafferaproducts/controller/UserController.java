package com.lafferaproducts.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lafferaproducts.service.ProductService;
import com.lafferaproducts.service.UserService;

public class UserController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(UserController.class.getName());
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ApplicationContext applicationContextProduct = new ClassPathXmlApplicationContext(
				"/com/lafferaproducts/resource/applicationContext.xml");

		ProductService productService = (ProductService) applicationContextProduct.getBean("productService");
		

		try {
			productService.getProduct(request);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
		
		ApplicationContext applicationContextUser = 
				new ClassPathXmlApplicationContext("/com/lafferaproducts/resource/applicationContext.xml");
		
		UserService userService = 
				(UserService) applicationContextUser.getBean("userService");
		 
		String page = "";
		String action = request.getParameter("action") == null ? "" : request.getParameter("action");
		
		try{
			
			
			if ("loginUser".equals(action)) {
				if (userService.loginUser(request)){
					if (userService.findUserType(request))
						page = "AdminUser.jsp";
					else page = "pages/homeUser.jsp";
				}else {
					page = "pages/login.jsp";
				}LOGGER.info("TEST");
			}else if("insertUser".equals(action)){
				if (userService.checkUserName(request)) {
					page = "pages/signup.jsp";
				} else if (userService.checkUserEmail(request)) {
					page = "pages/signup.jsp";
				} else {
					page = "pages/homeUser.jsp";
				}
			}else if("updateUser".equals(action)){
				userService.updateUser(request);
				page = "pages/homeUser.jsp";
			}else if ("getUser".equals(action)) {
				userService.getUser(request);
				page = "pages/infoPage.jsp";
			}else if ("getUserList".equals(action)) {
				userService.getUserList(request);
				page = "adminPageUpdateUser.jsp";
			}
			else if ("getUserListInAdd".equals(action)) {
				userService.getUserList(request);
				page = "adminPageAddUser.jsp";
			}else if("viewOrdinary".equals(action)) {

				page = "pages/homeAdmin.jsp";
			}
		} catch(SQLException e){
			System.out.println(e.getMessage());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}
}
