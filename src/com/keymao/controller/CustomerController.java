package com.keymao.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.keymao.domain.Orders;
import com.keymao.domain.Product;
import com.keymao.domain.User;
import com.keymao.service.OrdersService;
import com.keymao.service.ProductService;
import com.keymao.service.UserService;
import com.keymao.utils.RandomUtils;
import com.keymao.utils.TimeUtils;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Resource
	private OrdersService ordersService;
	
	@Resource 
	private UserService userService;
	
	@Resource 
	private ProductService productService;
	
	@RequestMapping("orders/insert")
	public String insert(Model model,Orders orders){
		String ordersId = TimeUtils.getTimestamp() + RandomUtils.generate4Random();
		try {
			orders.setOrdersId(ordersId);
/*			System.out.println("-----------------");
			System.out.println(orders.getAddress());*/
			ordersService.insertOne(orders);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//入库后重定向，根据是否数据库是否有数据判断插入是否成功
		return "redirect:/customer/orders/toInsertResult.do?ordersId=" + ordersId + "&productId="+orders.getProductId();
	}
	
	@RequestMapping("orders/toInsertResult")
	public String toInsertResult(Model model,String ordersId,String productId){
		String result = "orderFailure";
		//查库
		Orders bean = ordersService.selectByPrimaryKey(ordersId);
		Product product = productService.selectByPrimaryKey(productId);
		model.addAttribute("partHtml", product.getPartHtml());
		if(bean != null){ //插入成功
			result = "orderSuccess";
			model.addAttribute("ordersId", bean.getOrdersId());
			model.addAttribute("totalPrice", bean.getTotalPrice());
		}
		return result;
	}	
	
	
	//根据手机查询订单信息
	//produces属性，让传递到前台json数据不出现乱码
	@RequestMapping(value="orders/getOneByPhone",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getOneByPhone(Orders orders){
		Orders result = ordersService.getOneByPhone(orders.getPhone());
		if(result == null){
			result = new Orders();
			result.setTransStatus(0);
		}
		String str = JSON.toJSON(result).toString();
		return str;
		
	}
	
	
	//根据账号密码登录
	@RequestMapping("user/login")
	public @ResponseBody String login(Model model,User user,HttpServletRequest request){
		
		User result = userService.getUserByUsernameAndPassword(user);
		if(null == result){
			return "failure";
		} else{
			HttpSession session = request.getSession();	
			session.setAttribute("account",result.getAccount());
			return "success";
		}
/*		model.addAttribute("operateLogList", list);
		model.addAttribute("operateLog", operateLog);
		return "ordersList";*/
		
	}
}
