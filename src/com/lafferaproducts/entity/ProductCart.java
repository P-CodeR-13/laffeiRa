package com.lafferaproducts.entity;

import java.io.InputStream;
import java.math.BigDecimal;

public class ProductCart {

	

//	public ProductCart(Integer productId, String productName, Integer quantity, String description, String image,
//			BigDecimal price, String kinds) {
//		super(productId, productName, quantity, description, image, price, kinds);
//		// TODO Auto-generated constructor stub
//	}

//	private BigDecimal grandTotal;
	private Integer productId;
	private Integer quantity;
	private String productName;
	private BigDecimal productPrice;
	private String image;
	private Integer stock;
//	private BigDecimal totalPerItem;
//	public BigDecimal getTotalPerItem() {
//		return totalPerItem;
//	}
//
//	public void setTotalPerItem(BigDecimal totalPerItem) {
//		this.totalPerItem = totalPerItem;
//	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public BigDecimal getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(BigDecimal productPrice) {
		this.productPrice = productPrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

//	public BigDecimal getGrandTotal() {
//		return grandTotal;
//	}
//
//	public void setGrandTotal(BigDecimal grandTotal) {
//		this.grandTotal = grandTotal;
//	}

}
