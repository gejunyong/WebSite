package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.IProductsDao;
import com.website.lt.model.Products;

@Repository("productsDao")
public class ProductsDao extends BaseDao<Products> implements IProductsDao {

}
