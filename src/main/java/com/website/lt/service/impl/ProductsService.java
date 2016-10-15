package com.website.lt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.IProductsDao;
import com.website.lt.model.Pager;
import com.website.lt.model.Products;
import com.website.lt.service.IProductsService;

@Service("productsService")
public class ProductsService implements IProductsService {
	@Autowired
	private IProductsDao productsDao;

	@Override
	public Products load(int id) {
		return productsDao.load(id);
	}

	@Override
	public void add(Products products) {
		productsDao.add(products);
	}

	@Override
	public void update(Products products) {
		productsDao.update(products);
	}

	@Override
	public void delete(int id) {
		productsDao.delete(id);
	}

	@Override
	public Pager<Products> find() {
		return productsDao.find(" from Products order by id desc");
	}

}
