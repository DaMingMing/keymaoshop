package com.keymao.service;

import java.util.List;

import com.keymao.domain.User;


public interface UserService {
	/**
     * 根据用户名和密码查询用户是否存在
     *
     * @param user
     * @return user
     */
    public User getUserByUsernameAndPassword(User user);
    
    /**
     * 根据主键获取数据
     * @param userId
     * @return
     */
    User selectByPrimaryKey(String userId);
	
    /**
     * 更新数据
     * @param user
     */
	public void update(User user);
	
	/**
	 * 插入数据
	 * @param user
	 */
	public void insertOne(User user);
	
	/**
	 * 分页查询
	 * @param user
	 * @return
	 */
	List<User> pageQueryByCondition(User user);
	
	/**
	 * 根据条件获取总条数
	 * @param user
	 * @return
	 */
	public int countByCondition(User user); 

}
