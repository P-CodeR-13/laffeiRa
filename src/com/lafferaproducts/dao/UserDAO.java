package com.lafferaproducts.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lafferaproducts.entity.ProductCart;
import com.lafferaproducts.entity.User;

public interface UserDAO {
	void insertUser(User user) throws SQLException;
	void updateUser(User user) throws SQLException;
	User loginUser(String userName, String password) throws SQLException;
	List<User> getUserList() throws SQLException;
	void saveCart(Map<String, String> map) throws SQLException;
	ArrayList<ProductCart> getCart(String userName) throws SQLException;
}
