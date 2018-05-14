package com.keymao.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.keymao.domain.OperateLog;
import com.keymao.domain.Orders;
import com.keymao.dto.OrdersExt;
import com.keymao.service.OperateLogService;
import com.keymao.service.OrdersService;
import com.keymao.utils.Constant;


@Controller
@RequestMapping("/admin/orders")
public class OrdersController {
	
	@Resource
	private OrdersService ordersService;
	
	@Resource OperateLogService operateLogService;
	//查询所有商品
	@RequestMapping("list")
	public String list(Model model,Orders orders){
		//OrdersExt ordersExt = null;
		List<Orders> list = ordersService.findAllByCondition(orders);
		int totalRecords = ordersService.countByCondition(orders);
		model.addAttribute("ordersList", list);
		model.addAttribute("orders", orders);
		model.addAttribute("totalRecords", totalRecords);
		model.addAttribute("pageSize", Constant.PAGE_SIZE);
		return "ordersList";
		
	}
	
	//查询所有订单
	@RequestMapping(value="getOrdersList",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getOrdersList(Model model,Orders orders){
		orders.setStartIndex(orders.getCurrentPageNum() == 0 ? 0 :(orders.getCurrentPageNum() - 1) * Constant.PAGE_SIZE);
		List<Orders> list = ordersService.findAllByCondition(orders);
		int totalRecords = ordersService.countByCondition(orders);
		Orders result = new Orders();
		result.setListRecords(list);
		result.setTotalRecords(totalRecords);
		String str = JSON.toJSON(result).toString();
		return str;
		
	}	
	
	//跳转到修改页面
	@RequestMapping("edit")
	public @ResponseBody Orders edit(String ordersId , Model model){
		//根据ordersId查询订单
		Orders orders = ordersService.selectByPrimaryKey(ordersId);
		//页面回显
		model.addAttribute("item", orders);
		
		return orders;
	}
	
	@RequestMapping("update")
	public @ResponseBody String update(Orders orders,HttpServletRequest request){
		String result = "1";
		try {
			//写日志
			//原有数据
			Orders oldOrders = ordersService.selectByPrimaryKey(orders.getOrdersId());
			StringBuffer logDetail = new StringBuffer();
			logDetail.append("订单流水号[").append(orders.getOrdersId()).append("]");
			if(oldOrders.getPayStatus() != orders.getPayStatus()){
				logDetail.append("付款状态由").append(getPayStatusName(oldOrders.getPayStatus())).append(getPayStatusName(orders.getPayStatus()));
			}
			if(oldOrders.getTransStatus() != orders.getTransStatus()){
				logDetail.append("运输状态由").append(getTransStatusName(oldOrders.getTransStatus())).append(getTransStatusName(orders.getTransStatus()));
			}			
			OperateLog operateLog = new OperateLog();
			String account = "admin";
			Object user = request.getSession().getAttribute("account");
			if(null != user){
				account = user.toString();
			}
			operateLog.setAccount(account);
			operateLog.setLogDetail(logDetail.toString());
			operateLog.setLogModuleType(1);//订单
			operateLog.setLogType(1);//修改
			operateLogService.insertOne(operateLog);
			
			ordersService.updateByPrimaryKey(orders);
		} catch (Exception e) {
			result = "0";
			e.printStackTrace();
		} finally {
			return result;
		}
	}
	
	public String getPayStatusName(Integer payStatus){
		return payStatus == 1 ? "未支付" : "已支付";
	}
	
	public String getTransStatusName(Integer transStatus){
		//1—未发货；2—已发货；3—已确认收货
		String result = "";
		switch (transStatus) {
		case 1:
			result = "未发货";
			break;
		case 2:
			result = "已发货";
			break;
		case 3:
			result = "已确认收货";
			break;
		default:
			result = "未发货";
		}
		return result;
	}	
}
