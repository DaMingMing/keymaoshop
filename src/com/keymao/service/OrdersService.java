package com.keymao.service;

import java.util.List;

import com.keymao.domain.Orders;


public interface OrdersService {

	List<Orders> findAllByCondition(Orders orders);
	
	Orders selectByPrimaryKey(String ordersId);
	
	public void updateByPrimaryKey(Orders orders);
	
	public void insertOne(Orders orders);	
	
	public int countByCondition(Orders example);
	
	/**
	 * 通过手机号获取一条订单记录
	 * @param phone
	 * @return
	 */
	Orders getOneByPhone(String phone);
}
