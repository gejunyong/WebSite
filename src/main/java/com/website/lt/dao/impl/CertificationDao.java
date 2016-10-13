package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.ICertificationDao;
import com.website.lt.model.Certification;

@Repository("certificationDao")
public class CertificationDao extends BaseDao<Certification> implements ICertificationDao {
	
}
