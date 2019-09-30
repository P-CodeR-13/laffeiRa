package com.lafferaproducts.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.lafferaproducts.entity.ProductCart;

public interface UserService {
	void insertUser(HttpServletRequest req)throws SQLException;
	void updateUser(HttpServletRequest req)throws SQLException;
	Boolean loginUser(HttpServletRequest req)throws SQLException;
	void getUser(HttpServletRequest req) throws SQLException;
	void logOut(HttpServletRequest req) throws SQLException;
	Boolean findUserType(HttpServletRequest req);
	void getUserList(HttpServletRequest request) throws SQLException;
	Boolean ifSessionActive(HttpServletRequest req);
	void saveCart(HttpSession session, ArrayList<ProductCart> prod) throws SQLException;
	void getCart(String userName, HttpServletRequest request)throws SQLException;
	Boolean checkUserName(HttpServletRequest request) throws SQLException;
	Boolean checkUserEmail(HttpServletRequest request) throws SQLException;
}
