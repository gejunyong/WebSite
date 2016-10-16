package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.IInquiryDao;
import com.website.lt.model.Inquiry;

@Repository("inquiryDao")
public class InquiryDao extends BaseDao<Inquiry> implements IInquiryDao {

}
