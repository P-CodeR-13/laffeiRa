package com.lafferaproducts.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.lafferaproducts.dao.UserDAO;
import com.lafferaproducts.entity.ProductCart;
import com.lafferaproducts.entity.User;

public class UserDAOImpl implements UserDAO{

	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	@Override
	public void insertUser(User user) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.getSqlMapClient().insert("insert1User", user);
			
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
	public void updateUser(User user) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();

			this.getSqlMapClient().update("update1User", user);

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
	public User loginUser(String userName, String password) throws SQLException {
		User user = null;
		HashMap<String, String> map = new HashMap<>();
		map.put("userName", userName);
		map.put("password", password);
		try {
			user = (User)this.getSqlMapClient().queryForObject("get1User", map); // getEmployee - id sa emp
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;
	}
	@Override
	public List<User> getUserList() throws SQLException {
		// TODO Auto-generated method stub
		List<User> listUser = new ArrayList<>();
		try{
			listUser = this.getSqlMapClient().queryForList("getUserList");
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		return listUser;
	}

	@Override
	public void saveCart(Map<String, String> map) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.getSqlMapClient().insert("insertItems", map);
			
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
	public ArrayList<ProductCart> getCart(String userName) throws SQLException {
		// TODO Auto-generated method stub
				ArrayList<ProductCart> prod = null;
				try{
					prod = (ArrayList<ProductCart>)this.getSqlMapClient().queryForList("getCartList", userName);
				} catch (SQLException e){
					System.out.println(e.getMessage());
				}
		return prod;
	}
	
}
