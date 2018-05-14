package com.keymao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keymao.dao.UserMapper;
import com.keymao.domain.User;
import com.keymao.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper userMapper;

	@Override
	public User getUserByUsernameAndPassword(User user) {
		return userMapper.getUserByUsernameAndPassword(user);
	}

	@Override
	public User selectByPrimaryKey(String userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public void update(User user) {
		userMapper.update(user);
		
	}

	@Override
	public void insertOne(User user) {
		userMapper.insertOne(user);
		
	}

	@Override
	public List<User> pageQueryByCondition(User user) {
		return userMapper.pageQueryByCondition(user);
	}

	@Override
	public int countByCondition(User user) {
		return userMapper.countByCondition(user);
	}

}
