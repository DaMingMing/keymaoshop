package com.keymao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keymao.dao.OperateLogMapper;
import com.keymao.domain.OperateLog;
import com.keymao.domain.Orders;
import com.keymao.service.OperateLogService;


@Service
public class OperateLogServiceImpl implements OperateLogService {
	
	@Resource
	private OperateLogMapper operateLogMapper;

	@Override
	public List<OperateLog> findAllByCondition(OperateLog operateLog) {
		return operateLogMapper.selectCaseDetial(operateLog);
	}

	@Override
	public void insertOne(OperateLog operateLog) {
		operateLogMapper.insertOne(operateLog);
	}

	@Override
	public int countByCondition(OperateLog example) {
		return operateLogMapper.countByCondition(example);
	}

	@Override
	public List<OperateLog> selectCaseDetial(OperateLog example) {
		return operateLogMapper.selectCaseDetial(example);
	}
	


}
