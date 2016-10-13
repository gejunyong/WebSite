package com.website.lt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.ICertificationDao;
import com.website.lt.model.Certification;
import com.website.lt.model.Pager;
import com.website.lt.service.ICertificationService;

@Service("certificationService")
public class CertificationService implements ICertificationService {
	@Autowired
	private ICertificationDao certificationDao;

	@Override
	public Certification load(int id) {
		return certificationDao.load(id);
	}

	@Override
	public void add(Certification certification) {
		certificationDao.add(certification);
	}
	
	@Override
	public void update(Certification certification) {
		certificationDao.update(certification);
	}

	@Override
	public void delete(int id) {
		certificationDao.delete(id);
	}

	@Override
	public List<Certification> getList() {
		return certificationDao.list("from Certification order by sortId");
	}

	@Override
	public Pager<Certification> getPager() {
		return certificationDao.find("from Certification order by sortId");
	}

}
