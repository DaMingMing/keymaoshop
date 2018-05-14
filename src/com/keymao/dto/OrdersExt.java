package com.keymao.dto;

import com.keymao.domain.Orders;

public class OrdersExt extends Orders{
	//商品名称
	private String productName;
	
	private String beginTm;
	private String endTm;
	
	

	public String getBeginTm() {
		return beginTm;
	}

	public void setBeginTm(String beginTm) {
		this.beginTm = beginTm;
	}

	public String getEndTm() {
		return endTm;
	}

	public void setEndTm(String endTm) {
		this.endTm = endTm;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	} 
	
	
}
