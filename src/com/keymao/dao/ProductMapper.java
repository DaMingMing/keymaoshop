package com.keymao.dao;

import com.keymao.domain.Product;


public interface ProductMapper {

    /**
     * 根据主键获取数据
     * @param userId
     * @return
     */
    Product selectByPrimaryKey(String productId);
	
}
