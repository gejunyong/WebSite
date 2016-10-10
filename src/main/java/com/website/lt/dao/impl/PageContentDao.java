package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.IPageContentDao;
import com.website.lt.model.PageContent;

@Repository("pageContentDao")
public class PageContentDao extends BaseDao<PageContent> implements IPageContentDao {

}
