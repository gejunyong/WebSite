package com.website.lt.service;

import com.website.lt.model.PageContent;

public interface IPageContentService {

	public PageContent load(int id);
	public void update(PageContent pageContent);
}
