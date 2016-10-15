package com.website.lt.service;

import com.website.lt.model.Pager;
import com.website.lt.model.Products;

public interface IProductsService {
	public Products load(int id);
	public void add(Products products);
	public void update(Products products);
	public void delete(int id);
	public Pager<Products> find();
}
