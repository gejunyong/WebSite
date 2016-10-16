package com.website.lt.service;

import com.website.lt.model.Inquiry;
import com.website.lt.model.Pager;

public interface IInquiryService {
	public Inquiry load(int id);
	public void add(Inquiry inquiry);
	public Pager<Inquiry> find();
}
