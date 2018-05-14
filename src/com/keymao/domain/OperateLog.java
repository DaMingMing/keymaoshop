package com.keymao.domain;

import java.util.Date;

public class OperateLog extends Page<OperateLog>{
	//（操作日志id）:操作日志id  自增id
	private Integer logId;
	
	//（操作模块）： 0--订单  目前是操作 订单详情 默认0
	private Integer logModuleType;	
	
	//（操作类型）：0—修改  1—新增  2—删除
	private Integer logType;
	
	//（操作详情）：在XX时间 对XX订单号做XX操作
	private String logDetail;
	
	//（操作人账号）:操作人账号
	private String account;
	
	//（创建日期）：创建日期
	private Date createTm;
	
	//（修改日期）：修改日期
	private Date updateTm;

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
	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Integer getLogModuleType() {
		return logModuleType;
	}

	public void setLogModuleType(Integer logModuleType) {
		this.logModuleType = logModuleType;
	}

	public Integer getLogType() {
		return logType;
	}

	public void setLogType(Integer logType) {
		this.logType = logType;
	}

	public String getLogDetail() {
		return logDetail;
	}

	public void setLogDetail(String logDetail) {
		this.logDetail = logDetail;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	

}
