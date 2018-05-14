package com.keymao.domain;

import java.util.Date;

public class User extends Page<User>{
	//	（管理员ID）：管理员登录ID  自增id
	private Integer userId;
	
	//（管理员登录账号）
	private String account;
	
	//（管理员密码）：管理员登录密码
	private String password;

	//（姓名）：管理员姓名
	private String name;
	
	//（性别）：管理员性别
	private Integer sex;
	
	//（创建日期）：创建日期
	private Date createTm;
	
	//（修改日期）：修改日期
	private Date updateTm;
	
	//（描述）
	private String remark;

	private String beginTm;
	
	private String endTm;
	
	//（状态）：是否失效
	private Integer isInvalid;
	

	public Integer getIsInvalid() {
		return isInvalid;
	}

	public void setIsInvalid(Integer isInvalid) {
		this.isInvalid = isInvalid;
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

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	
}
