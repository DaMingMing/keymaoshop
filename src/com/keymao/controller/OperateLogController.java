package com.keymao.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.keymao.domain.OperateLog;
import com.keymao.domain.Orders;
import com.keymao.service.OperateLogService;
import com.keymao.utils.Constant;


@Controller
@RequestMapping("/admin/operateLog")
public class OperateLogController {
	
	
	@Resource OperateLogService operateLogService;
	//查询所有商品
	@RequestMapping("list")
	public String list(Model model,OperateLog operateLog){
		List<OperateLog> list = operateLogService.findAllByCondition(operateLog);
		int totalRecords = operateLogService.countByCondition(operateLog);
		model.addAttribute("totalRecords", totalRecords);
		model.addAttribute("pageSize", Constant.PAGE_SIZE);
		model.addAttribute("operateLogList", list);
		model.addAttribute("operateLog", operateLog);
		return "operateLogList";
		
	}
	
	//查询所有订单
	@RequestMapping(value="getOperateLogList",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getOrdersList(Model model,OperateLog operateLog){
		operateLog.setStartIndex(operateLog.getCurrentPageNum() == 0 ? 0 :(operateLog.getCurrentPageNum() - 1) * Constant.PAGE_SIZE);
		List<OperateLog> list = operateLogService.findAllByCondition(operateLog);
		int totalRecords = operateLogService.countByCondition(operateLog);
		OperateLog result = new OperateLog();
		result.setListRecords(list);
		result.setTotalRecords(totalRecords);
		String str = JSON.toJSON(result).toString();
		return str;
		
	}
	
}
