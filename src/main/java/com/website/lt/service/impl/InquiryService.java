package com.website.lt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.IInquiryDao;
import com.website.lt.model.Inquiry;
import com.website.lt.model.Pager;
import com.website.lt.service.IInquiryService;

@Service("inquiryService")
public class InquiryService implements IInquiryService {

	@Autowired
	private IInquiryDao inquiryDao;
	
	@Override
	public Inquiry load(int id) {
		return inquiryDao.load(id);
	}

	@Override
	public void add(Inquiry inquiry) {
		inquiryDao.add(inquiry);
	}

	@Override
	public Pager<Inquiry> find() {
		return inquiryDao.find(" from Inquiry order by id desc ");
	}

}
