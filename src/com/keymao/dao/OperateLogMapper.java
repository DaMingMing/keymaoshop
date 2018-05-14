package com.keymao.dao;

import java.util.List;

import com.keymao.domain.OperateLog;
import com.keymao.domain.Orders;

public interface OperateLogMapper {
	List<OperateLog> selectByExample(OperateLog operateLog);
	
	public void insertOne(OperateLog operateLog);
	
	public int countByCondition(OperateLog example);
	
	List<OperateLog> selectCaseDetial(OperateLog example);
}
