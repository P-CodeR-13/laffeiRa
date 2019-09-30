package com.lafferaproducts.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.lafferaproducts.dao.UserDAO;
import com.lafferaproducts.entity.ProductCart;
import com.lafferaproducts.entity.User;
import com.lafferaproducts.service.ProductService;
import com.lafferaproducts.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public void insertUser(HttpServletRequest req) throws SQLException {
		User user = setValuesToUser(req);
		this.userDAO.insertUser(user);
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		req.setAttribute("user", user);
		getCart(user.getUserName(), req);
	}

	private User setValuesToUser(HttpServletRequest req) {
		User user = new User(req.getParameter("userName"), req.getParameter("password"), req.getParameter("firstName"),
				req.getParameter("middleName"), req.getParameter("lastName"), req.getParameter("address"),
				req.getParameter("contactNumber"), req.getParameter("email"), 
				req.getParameter("userType")
//				== null?"ORDINARY":"ADMIN"
				, req.getParameter("birthDate"),
				req.getParameter("gender"), null);
		return user;

	}

	@Override
	public void updateUser(HttpServletRequest req) throws SQLException {
		User user = setValuesToUser(req);
		this.userDAO.updateUser(user);
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		getCart(user.getUserName(), req);
	}

	@Override
	public Boolean loginUser(HttpServletRequest req) throws SQLException {
		HttpSession session = req.getSession();
		User tempUser = (User) session.getAttribute("user");
		String userName = "";
		String password = "";
//		String tempBDate = "";
		if (tempUser != null) {
			userName = tempUser.getUserName();
			password = tempUser.getPassword();
//			tempBDate =  tempUser.getBirthDate();
		} else {
			userName = req.getParameter("userName");
			password = req.getParameter("password");
		}

		User user = this.userDAO.loginUser(userName, password);
		if (user != null) {
			session = req.getSession();
			session.setAttribute("user", user);
			req.setAttribute("user", user);
			req.setAttribute("errorMessageLogin", "");
			getCart(userName, req);
			return true;
		}
		req.setAttribute("errorMessageLogin", "Incorrect username or password");
		return false;
	}

	public Boolean findUserType(HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if ("ADMIN".equalsIgnoreCase(user.getUserType()))
			return true;
		return false;
	}

	@Override
	public void getUser(HttpServletRequest req) throws SQLException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		req.setAttribute("user", user);
		ArrayList<ProductCart> prod = (ArrayList<ProductCart>)session.getAttribute("prod");
		saveCart(session, prod);
	}

	@Override
	public void logOut(HttpServletRequest req) throws SQLException {
		HttpSession session = req.getSession();
		ArrayList<ProductCart> prod = (ArrayList<ProductCart>)session.getAttribute("prod");
		if (prod!=null) {
			saveCart(session, prod);
		}
		session.invalidate();

	}

	@Override
	public void getUserList(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub

		request.setAttribute("userList", userDAO.getUserList());

	}
	
	public Boolean ifSessionActive(HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user!=null)
			return true;
		
		return false;
	}

	@Override
	public void saveCart(HttpSession session, ArrayList<ProductCart> prod) throws SQLException {
		
		User user = (User)session.getAttribute("user");
		String userName = user.getUserName();
		Map<String, String> map = new HashMap<>();
		for (ProductCart productCart : prod) {
			map.put("userName", userName);
			map.put("productId", String.valueOf(productCart.getProductId()));
			map.put("quantity", String.valueOf(productCart.getQuantity()));
			this.userDAO.saveCart(map);
			map.clear();
		} 
		
		
	}
	
	@Override
	public void getCart(String userName, HttpServletRequest request) throws SQLException {
				HttpSession session = request.getSession();
				ArrayList<ProductCart> prod = this.userDAO.getCart(userName);
				request.setAttribute("productCartList", prod);
				request.setAttribute("productCartSize", prod.size());
				session.setAttribute("prod", prod);
				request.setAttribute("grandTotal", ProductServiceImpl.computeGrandTotal(request));
					

	}
	
	@Override
	public Boolean checkUserName(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		User userSignup = this.setValuesToUser(request);
		for (User user : this.userDAO.getUserList()) {
			if (user.getUserName().equalsIgnoreCase(userSignup.getUserName())) {
				request.setAttribute("errorMessageUserName", "UserName Exist");
				return true;
			}
		}
		request.setAttribute("errorMessageUserName", "");
		return false;

	}

	@Override
	public Boolean checkUserEmail(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		User userSignup = this.setValuesToUser(request);
		for (User user : this.userDAO.getUserList()) {
			if (user.getEmail().equalsIgnoreCase(userSignup.getEmail())) {
				request.setAttribute("errorMessageEmail", "Email Exist");
				return true;
			}
		}
		request.setAttribute("errorMessageEmail", "");
		return false;

	}
}
