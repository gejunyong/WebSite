package com.website.lt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.INewsDao;
import com.website.lt.model.News;
import com.website.lt.model.Pager;
import com.website.lt.service.INewsService;

@Service("newsService")
public class NewsService implements INewsService {
	
	@Autowired
	private INewsDao newsDao;

	@Override
	public News load(int id) {
		return newsDao.load(id);
	}

	@Override
	public void add(News news) {
		newsDao.add(news);
	}

	@Override
	public void update(News news) {
		newsDao.update(news);
	}

	@Override
	public void delete(int id) {
		newsDao.delete(id);
	}

	@Override
	public Pager<News> find() {
		return newsDao.find(" from News order by id desc ");
	}

}
