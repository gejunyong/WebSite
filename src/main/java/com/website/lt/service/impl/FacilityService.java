package com.website.lt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.IFacilityDao;
import com.website.lt.model.Facility;
import com.website.lt.model.Pager;
import com.website.lt.service.IFacilityService;

@Service("facilityService")
public class FacilityService implements IFacilityService {
	@Autowired
	private IFacilityDao facilityDao;

	@Override
	public Facility load(int id) {
		return facilityDao.load(id);
	}

	@Override
	public void add(Facility facility) {
		facilityDao.add(facility);
	}
	
	@Override
	public void update(Facility facility) {
		facilityDao.update(facility);
	}

	@Override
	public void delete(int id) {
		facilityDao.delete(id);
	}

	@Override
	public List<Facility> getList() {
		return facilityDao.list("from Facility order by sortId");
	}

	@Override
	public Pager<Facility> getPager() {
		return facilityDao.find("from Facility order by sortId");
	}


	
	
}
