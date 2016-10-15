package com.website.lt.service;

import java.util.List;

import com.website.lt.model.Category;
import com.website.lt.model.News;
import com.website.lt.model.Pager;

public interface ICategoryService {
	
	public Category load(int id);
	public void add(Category category);
	public void update(Category category);
	public void delete(int id);
	public Pager<Category> find();
	public List<Category> list();
	public List<Category> list(int leaf);

}
