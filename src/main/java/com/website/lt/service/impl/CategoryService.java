package com.website.lt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.ICategoryDao;
import com.website.lt.model.Category;
import com.website.lt.model.Pager;
import com.website.lt.service.ICategoryService;

@Service("categoryService")
public class CategoryService implements ICategoryService {
	@Autowired
	private ICategoryDao categoryDao;

	@Override
	public Category load(int id) {
		return categoryDao.load(id);
	}

	@Override
	public void add(Category category) {
		categoryDao.add(category);
	}

	@Override
	public void update(Category category) {
		categoryDao.update(category);
	}

	@Override
	public void delete(int id) {
		categoryDao.delete(id);
	}

	@Override
	public Pager<Category> find() {
		return categoryDao.find(" from Category order by pId,sortId ");
	}

	@Override
	public List<Category> list() {
		List<Category> list=categoryDao.list(" from Category order by pId,sortId ");
		for (Category c : list) {
			c.setOpen(true);
		}
		return list;
	}
	@Override
	public List<Category> list(int leaf) {
		if(leaf==0){
			return categoryDao.list(" from Category where pId<=1 order by sortId");
		}else if(leaf==1){
			return categoryDao.list(" from Category where pId>1 order by sortId");
		}else if(leaf==2){
			return categoryDao.list(" from Category where pId=1 order by sortId");
		}else{
			return null;
		}
	}
	
	@Override
	public List<Category> cList(int pid){
			return categoryDao.list(" from Category where pId=? order by sortId",pid);
	}


}
