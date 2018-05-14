package com.keymao.service;

import com.keymao.domain.Product;


public interface ProductService {
    /**
     * 根据主键获取数据
     * @param userId
     * @return
     */
    Product selectByPrimaryKey(String productId);
	

}
