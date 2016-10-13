package com.website.lt.service;

import java.util.List;

import com.website.lt.model.Facility;
import com.website.lt.model.Pager;

public interface IFacilityService {
	
	public Facility load(int id);
	public void add(Facility facility);
	public void update(Facility facility);
	public void delete(int id);
	public List<Facility> getList();
	public Pager<Facility> getPager();

	
}
