package com.keymao.service;

import java.util.List;

import com.keymao.domain.OperateLog;
import com.keymao.domain.Orders;


public interface OperateLogService {

	List<OperateLog> findAllByCondition(OperateLog operateLog);
	
	public void insertOne(OperateLog operateLog);
	
	public int countByCondition(OperateLog example);
	
	List<OperateLog> selectCaseDetial(OperateLog example);
	
}
