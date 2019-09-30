package com.lafferaproducts.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lafferaproducts.dao.ProductDAO;
import com.lafferaproducts.entity.Product;
import com.lafferaproducts.entity.ProductCart;

public class ProductDAOImpl implements ProductDAO {

	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Product> getProduct() throws SQLException {
		List<Product> listProd = new ArrayList<>();
		try {
			listProd = this.getSqlMapClient().queryForList("getProduct"); // getProduct - id sa prod
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return listProd;
	}
	public ProductCart addTocart(Integer productId) throws SQLException {
		ProductCart listProd = null;
		try {
			listProd = (ProductCart)this.getSqlMapClient().queryForObject("getProductById", productId); // getProduct - id sa prod
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return listProd;
	}

	@Override
	public void checkout(Integer productId, Integer quantity) throws SQLException {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("productId", productId);
		map.put("quantity", quantity);
		
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.getSqlMapClient().update("updateProdStock", map);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			this.getSqlMapClient().getCurrentConnection().rollback();
		} finally {
			this.sqlMapClient.endTransaction();
		}
	}

	@Override
	public void removeInCartTable(String userName) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.getSqlMapClient().delete("deleteCartItems", userName);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			this.getSqlMapClient().getCurrentConnection().rollback();
		} finally {
			this.sqlMapClient.endTransaction();
		}
		
	}
	
	@Override
	public void insertProduct(Product product) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();

			this.getSqlMapClient().insert("insertProduct", product);

			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();

		} catch (SQLException e) {
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		} finally {
			this.sqlMapClient.endTransaction();
		}

	}

	@Override
	public void updateProduct(Product product) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();

			this.getSqlMapClient().update("updateProduct", product);

			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			this.getSqlMapClient().getCurrentConnection().rollback();
		} finally {
			this.sqlMapClient.endTransaction();
		}

	}
	
	public List<Product> getProductAdmin() throws SQLException {
		List<Product> listProd = new ArrayList<>();
		try {
			listProd = this.getSqlMapClient().queryForList("getProductsAdmin"); // getProduct - id sa prod
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return listProd;
	}
}
