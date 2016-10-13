package com.website.lt.service;

import java.util.List;

import com.website.lt.model.Certification;
import com.website.lt.model.Pager;

public interface ICertificationService {

	public Certification load(int id);
	public void add(Certification certification);
	public void update(Certification certification);
	public void delete(int id);
	public List<Certification> getList();
	public Pager<Certification> getPager();

}
