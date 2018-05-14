package com.keymao.domain;

import java.sql.Timestamp;

public class Orders extends Page<Orders>{
	
	//（流水号）：由当前年月日时分秒+4位随机数组成
	private String ordersId;
	
	//（付款状态）：0—未支付；1—已支付  默认0
	private Integer payStatus;
	
	//（运输状态）：0—未发货；1—已发货；2—已确认收货  默认0
	private Integer transStatus;
	
	//（付款方式）：0—paypel；1—货到付款  默认0
	private Integer payType;
	
	//（数量）：商品数量
	private Integer amount;
	
	//（总价格）：订单总价格
	private double totalPrice;
	
	//（商品Id）：商品id
	private Integer productId;
	
	//（地址）：收货人地址
	private String address;
	
	//（电话）：收货人电话
	private String phone;
	
	//（创建日期）：订单创建日期
	private Timestamp createTm;
	
	//（修改日期）：订单修改日期
	private Timestamp updateTm;
	
	//（备注）:客户备注
	private String remark;
	
	//商品名称
	private String productName;

	private String beginTm;
	private String endTm;
	
	//收货人
	private String userName;
	//收货人邮箱
	private String email; 
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

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

	public String getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}

	public Integer getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}

	public Integer getTransStatus() {
		return transStatus;
	}

	public void setTransStatus(Integer transStatus) {
		this.transStatus = transStatus;
	}

	public Integer getPayType() {
		return payType;
	}

	public void setPayType(Integer payType) {
		this.payType = payType;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getCreateTm() {
		return createTm;
	}

	public void setCreateTm(Timestamp createTm) {
		this.createTm = createTm;
	}

	public Timestamp getUpdateTm() {
		return updateTm;
	}

	public void setUpdateTm(Timestamp updateTm) {
		this.updateTm = updateTm;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
