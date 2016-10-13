package com.website.lt.service;

import com.website.lt.model.News;
import com.website.lt.model.Pager;

public interface INewsService {
	
	public News load(int id);
	public void add(News news);
	public void update(News news);
	public void delete(int id);
	public Pager<News> find();
}
