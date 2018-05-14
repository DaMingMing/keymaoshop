package com.keymao.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.keymao.dao.ProductMapper;
import com.keymao.domain.Product;
import com.keymao.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {
	
	@Resource
	private ProductMapper productMapper;


	@Override
	public Product selectByPrimaryKey(String userId) {
		return productMapper.selectByPrimaryKey(userId);
	}


}
