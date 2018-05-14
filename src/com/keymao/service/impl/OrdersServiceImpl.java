package com.keymao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keymao.dao.OrdersMapper;
import com.keymao.domain.Orders;
import com.keymao.service.OrdersService;


@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Resource
	private OrdersMapper ordersDao;
	

	@Override
	public List<Orders> findAllByCondition(Orders orders) {
		//service返回page<T> 并且处理其他信息 
		List<Orders> list = ordersDao.selectCaseDetial(orders);
		return list;
	}


	@Override
	public Orders selectByPrimaryKey(String ordersId) {
		return ordersDao.selectByPrimaryKey(ordersId);
	}


	@Override
	public void updateByPrimaryKey(Orders orders) {
		ordersDao.updateByPrimaryKey(orders);
	}


	@Override
	public void insertOne(Orders orders) {
		ordersDao.insertOne(orders);
		
	}


	@Override
	public int countByCondition(Orders example) {
		return ordersDao.countByCondition(example);
	}


	@Override
	public Orders getOneByPhone(String phone) {
		return ordersDao.getOneByPhone(phone);
	}

}
