package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.INewsDao;
import com.website.lt.model.News;

@Repository("newsDao")
public class NewsDao extends BaseDao<News> implements INewsDao {

}
