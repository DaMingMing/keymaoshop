package com.keymao.domain;

import java.util.Date;

public class Product extends Page<Product>{
	//（商品Id）：商品id  自增id
	private Integer productId;
	
	//（颜色）：商品颜色
	private Integer color;
	
	//（尺寸）：商品尺寸
	private Integer size;
	
	//（价格）：商品价格
	private double price;
	
	//（描述）：商品描述	
	private String desc;

	//（创建日期）：创建日期
	private Date createTm;
	
	//（修改日期）：修改日期
	private Date updateTm;

	//（商品名称）：商品名称
	private String productName;
	
	private String partHtml;
	
	
	public String getPartHtml() {
		return partHtml;
	}

	public void setPartHtml(String partHtml) {
		this.partHtml = partHtml;
	}

	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getColor() {
		return color;
	}

	public void setColor(Integer color) {
		this.color = color;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getCreateTm() {
		return createTm;
	}

	public void setCreateTm(Date createTm) {
		this.createTm = createTm;
	}

	public Date getUpdateTm() {
		return updateTm;
	}

	public void setUpdateTm(Date updateTm) {
		this.updateTm = updateTm;
	}

	
}
