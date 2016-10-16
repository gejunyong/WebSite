package com.website.lt.service;

import java.util.List;

import com.website.lt.model.Pager;
import com.website.lt.model.Products;

public interface IProductsService {
	public Products load(int id);
	public void add(Products products);
	public void update(Products products);
	public void delete(int id);
	public Pager<Products> find();
	public List<Products> list(int pid);
	public List<Products> enqPList(String sql);
	public List<Products> searchList(String key);
}
