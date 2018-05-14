package com.keymao.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.keymao.domain.Orders;
import com.keymao.domain.User;
import com.keymao.service.UserService;
import com.keymao.utils.Constant;


@Controller
@RequestMapping("/admin/user")
public class UserController {
	
	@Resource UserService userService;
	
	//退出登录
	@RequestMapping("logout")
	public void logout(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("account");
		request.getSession().invalidate();
		try {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	
	//查询所有用户
	@RequestMapping("list")
	public String list(Model model,User user){
		List<User> list = userService.pageQueryByCondition(user);
		int totalRecords = userService.countByCondition(user);
		model.addAttribute("userList", list);
		model.addAttribute("user", user);
		model.addAttribute("totalRecords", totalRecords);
		model.addAttribute("pageSize", Constant.PAGE_SIZE);
		return "userList";
	}
	
	//查询所有用户
	@RequestMapping(value="getUserList",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getOrdersList(Model model,User user){
		user.setStartIndex(user.getCurrentPageNum() == 0 ? 0 :(user.getCurrentPageNum() - 1) * Constant.PAGE_SIZE);
		List<User> list = userService.pageQueryByCondition(user);
		int totalRecords = userService.countByCondition(user);
		User result = new User();
		result.setListRecords(list);
		result.setTotalRecords(totalRecords);
		String str = JSON.toJSON(result).toString();
		return str;
		
	}	
}
