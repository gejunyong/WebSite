package com.website.lt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.IPageContentDao;
import com.website.lt.model.PageContent;
import com.website.lt.service.IPageContentService;

@Service("pageContentService")
public class PageContentService implements IPageContentService {

	@Autowired
	private IPageContentDao pageContentDao;
	
	@Override
	public PageContent load(int id) {
		return pageContentDao.load(id);
	}

	@Override
	public void update(PageContent pageContent) {
		pageContentDao.update(pageContent);
	}

}
