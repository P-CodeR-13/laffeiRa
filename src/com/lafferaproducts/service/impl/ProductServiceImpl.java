package com.lafferaproducts.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;


import com.lafferaproducts.dao.ProductDAO;
import com.lafferaproducts.entity.Product;
import com.lafferaproducts.entity.ProductCart;
import com.lafferaproducts.entity.User;
import com.lafferaproducts.service.ProductService;


public class ProductServiceImpl implements ProductService {

	private static final Logger LOGGER = LogManager.getLogger(ProductServiceImpl.class.getName());

	private ProductDAO productDAO;

	public ProductDAO getProductDAO() {
		return productDAO;
	}

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
 
	@Override
	public void getProduct(HttpServletRequest request) throws SQLException {
		request.setAttribute("prodList", productDAO.getProduct());
	}

	private Product setValuesToProd(HttpServletRequest request) {
		Product prod = new Product();

		prod.setProductId(Integer.parseInt(request.getParameter("productId")));
		prod.setProductName(request.getParameter("productName"));
		prod.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		prod.setDescription(request.getParameter("description"));
		String s = request.getParameter("image");
		int i = s.lastIndexOf("\\");
		prod.setImage(s.substring(i + 1));
		prod.setPrice(new BigDecimal(request.getParameter("price")));
		prod.setKinds(request.getParameter("kinds"));

		return prod;
	}
	@Override
	public Boolean addToCart(HttpServletRequest request) throws SQLException {
		Integer productId = Integer.parseInt(request.getParameter("productId"));
		HttpSession session = request.getSession();
		ArrayList<ProductCart> prod = (ArrayList<ProductCart>)session.getAttribute("prod");
		if (prod!=null) {
		for (ProductCart productCart : prod) {
			int cartId = productCart.getProductId();
			if (cartId == productId) {
				request.setAttribute("productCartList", prod);
				session.setAttribute("prod", prod);
				request.setAttribute("grandTotal", computeGrandTotal(request));
				
				return false;
			}
		}
		}else {
			prod = new ArrayList<ProductCart>();
		}

		ProductCart productCart = this.productDAO.addTocart(productId);

		if (productCart != null) {
			productCart.setQuantity(1);
			prod.add(productCart);
			request.setAttribute("productCartList", prod);
			session.setAttribute("prod", prod);
			request.setAttribute("grandTotal", computeGrandTotal(request));
			
			return true;
		}

		return false;
	}
	
	@Override
	public void removeToCart(HttpServletRequest request) throws SQLException{
		Integer productId = Integer.parseInt(request.getParameter("productId"));
		HttpSession session =request.getSession();
		ArrayList<ProductCart> prod = (ArrayList<ProductCart>)session.getAttribute("prod");
		for (int i = 0; i < prod.size(); i++) {
			int cartId = prod.get(i).getProductId();
			if (productId == cartId) {
				prod.remove(i);
			}
		}
		if (prod.size() > 0) {
			request.setAttribute("productCartList", prod);
			session.setAttribute("prod", prod);
		}
		request.setAttribute("productCartSize", prod.size());
		request.setAttribute("grandTotal", computeGrandTotal(request));
	}
	
	@Override
	public void updateCart(HttpServletRequest request) throws SQLException{
		
		Integer productId = Integer.parseInt(request.getParameter("productId"));
		HttpSession session = request.getSession();
		ArrayList<ProductCart> prod = (ArrayList<ProductCart>)session.getAttribute("prod");
		for (int i = 0; i < prod.size(); i++) {
			int cartId = prod.get(i).getProductId();
			if (productId == cartId) {
				Integer quantity = Integer.parseInt(request.getParameter("quantity"));
				prod.get(i).setQuantity(quantity);
				break;
			}
		}
		if (prod.size() > 0) {
			request.setAttribute("productCartList", prod);
			session.setAttribute("prod", prod);
		}
		request.setAttribute("productCartSize", prod.size());
		request.setAttribute("grandTotal", computeGrandTotal(request));
	}
	
	public static BigDecimal computeGrandTotal(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<ProductCart> prod = (ArrayList<ProductCart>)session.getAttribute("prod");
		BigDecimal bdGrandTotal = new BigDecimal(0);
		for (ProductCart productCart : prod) {
			bdGrandTotal = bdGrandTotal
					.add(productCart.getProductPrice().multiply(new BigDecimal(productCart.getQuantity())));
		}
		return bdGrandTotal;
	}
	@Override
	public void checkout(HttpServletRequest request) throws SQLException{
		HttpSession session = request.getSession();
		ArrayList<ProductCart> prod = (ArrayList<ProductCart>)session.getAttribute("prod");
		for (int i = 0 ; i < prod.size(); i++) {
			this.productDAO.checkout(prod.get(i).getProductId(), prod.get(i).getQuantity());
		}
		
		BigDecimal payment = new BigDecimal(request.getParameter("payment"));
		BigDecimal change = new BigDecimal(0);
		BigDecimal grandTotal = computeGrandTotal(request);
		change = payment.subtract(grandTotal);
		printReceipt(grandTotal.setScale(2, BigDecimal.ROUND_CEILING), 
					payment.setScale(2, BigDecimal.ROUND_CEILING),
					change.setScale(2, BigDecimal.ROUND_CEILING),
					request);
		prod.clear();
		removeInCartTable(session);
		session.setAttribute("prod", prod);
		getProduct(request);
	}

	
	public void printReceipt(BigDecimal grandTotal,BigDecimal payment,BigDecimal change, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<ProductCart> prod = (ArrayList<ProductCart>)session.getAttribute("prod");
		
		FileWriter fw = null;
		BufferedWriter bw = null;
		try {
			fw = new FileWriter(new File("C:\\Users\\CPI TRAINEE\\eclipse-workspace1\\CPIProject\\receipt.txt"));
			bw = new BufferedWriter(fw);
			
			bw.write("\t\tLaffera Shop\t\t");
			bw.newLine();
			bw.write("80 Ortigas Ave, San Juan, 1500 Metro Manila");
			bw.newLine();
			bw.write("***********************************************************");
			bw.newLine();
			bw.write("\tID\tProduct Name\tQuantity\tPrice\tTotal Price per Item");
			bw.newLine();
			for (ProductCart productCart : prod) {
				bw.write("\t" + productCart.getProductId()+"\t"+
							productCart.getProductName() + "\t"+
							productCart.getQuantity() + "\t"+
							productCart.getProductPrice() + "\t"+
							productCart.getProductPrice().multiply(new BigDecimal(productCart.getQuantity())));
				bw.newLine();
			} 
			
			bw.write("***********************************************************");
			bw.newLine();
			bw.write("Total : " + grandTotal);
			bw.newLine();
			bw.write("Payment : " + payment);
			bw.newLine();
			bw.write("Change : " + change);
			bw.newLine();
			bw.write("***********************************************************");
			bw.newLine();
			bw.write("\t\t\tTHANK YOU!!!\t\t\t\t");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				bw.close();
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	
	public void removeInCartTable(HttpSession session) throws SQLException {
		User user = (User)session.getAttribute("user");
		this.productDAO.removeInCartTable(user.getUserName());
		
	}
	@Override
	public void insertProduct(HttpServletRequest request) throws SQLException {
		Product product = setValuesToProd(request);
		this.productDAO.insertProduct(product);
	}

	@Override
	public void updateProduct(HttpServletRequest request) throws SQLException {
		Product product = setValuesToProd(request);
		this.productDAO.updateProduct(product);

	}

	@Override
	public void getProductAdmin(HttpServletRequest request) throws SQLException {
		request.setAttribute("prodListAdmin", productDAO.getProductAdmin());
		request.setAttribute("prodListAdminSize", productDAO.getProductAdmin().size());
		ArrayList<Product> product = (ArrayList<Product>)productDAO.getProductAdmin();
	}


}
