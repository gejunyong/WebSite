package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.ICategoryDao;
import com.website.lt.model.Category;

@Repository("categoryDao")
public class CategoryDao extends BaseDao<Category> implements ICategoryDao{
	
}
