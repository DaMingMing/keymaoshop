package com.keymao.dao;

import java.util.List;

import com.keymao.domain.Orders;

public interface OrdersMapper {
    List<Orders> selectByExample(Orders example);

	Orders selectByPrimaryKey(String ordersId);
	
	public void updateByPrimaryKey(Orders orders);
	
	public void insertOne(Orders orders);
	
	
	List<Orders> selectCaseDetial(Orders example);
	
	public int countByCondition(Orders example);
	
	/**
	 * 通过手机号获取一条订单记录
	 * @param phone
	 * @return
	 */
	Orders getOneByPhone(String phone);
}
