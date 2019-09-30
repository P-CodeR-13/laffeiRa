package com.lafferaproducts.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.lafferaproducts.entity.Product;


public interface ProductService {
	void getProduct(HttpServletRequest request) throws SQLException;
	void removeToCart(HttpServletRequest request)throws SQLException;
	void updateCart(HttpServletRequest request)throws SQLException;
	Boolean addToCart(HttpServletRequest request)throws SQLException;
	void checkout(HttpServletRequest request)throws SQLException;
	void insertProduct(HttpServletRequest request) throws SQLException;
	void updateProduct(HttpServletRequest request) throws SQLException;
	void getProductAdmin(HttpServletRequest request) throws SQLException;

}
