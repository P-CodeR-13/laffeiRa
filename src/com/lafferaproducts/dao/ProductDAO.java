package com.lafferaproducts.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.lafferaproducts.entity.Product;
import com.lafferaproducts.entity.ProductCart;


public interface ProductDAO {
	List<Product> getProduct() throws SQLException;
	ProductCart addTocart(Integer productId) throws SQLException;
	void checkout(Integer productId, Integer quantity)throws SQLException;
	void removeInCartTable(String userName)throws SQLException;
	void insertProduct(Product product) throws SQLException;
	void updateProduct(Product product) throws SQLException;
	public List<Product> getProductAdmin() throws SQLException;
}
