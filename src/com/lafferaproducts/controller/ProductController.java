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


public class ProductController extends HttpServlet {

	private static final long serialVersionUID = -3254083445269926470L;
	private static final Logger LOGGER = LogManager.getLogger(ProductController.class.getName());

	@Override
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "";

		try {
			ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
					"/com/lafferaproducts/resource/applicationContext.xml");

			ProductService productService = (ProductService) applicationContext.getBean("productService");

			productService.getProduct(request);
			page = "pages/homeUser.jsp";
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/com/lafferaproducts/resource/applicationContext.xml");

		ProductService productService = (ProductService) applicationContext.getBean("productService");

		String page = "";
		String action = request.getParameter("action") == null ? "" : request.getParameter("action");
		try {
			if ("addToCart".equals(action)) {
				if (productService.addToCart(request)) {
					page = "pages/product.jsp";
				}else {
					page = "pages/product.jsp";
				}
			}else if ("removeToCart".equals(action)) {
				productService.removeToCart(request);
				page = "pages/product.jsp";
			}else if ("updateCart".equals(action)) {
				productService.updateCart(request);
				page = "pages/product.jsp";
			} else if ("checkout".equals(action)) {
				productService.checkout(request);
				page = "pages/checkout.jsp";
			} else if ("insertProduct".equals(action)) {
				productService.insertProduct(request);
				page = "";
			}else if ("getProduct".equals(action)) {
				productService.getProductAdmin(request);
				page = "AddProduct.jsp";
			}else if ("updateProduct".equals(action)) {
				productService.updateProduct(request);
				page = "updateProduct.jsp";
			} else if ("goUpdate".equals(action)) {
				page = "updateProduct.jsp";
			} else if ("getProductList".equals(action)) {
				productService.getProductAdmin(request);
				page = "updateProduct.jsp";
			}else if ("productVisitor".equals(action)) {
				productService.getProduct(request);
				page = "pages/tableVisitor.jsp";
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
	}

}
