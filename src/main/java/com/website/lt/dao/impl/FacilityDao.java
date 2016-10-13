package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.IFacilityDao;
import com.website.lt.model.Facility;

@Repository("facilityDao")
public class FacilityDao extends BaseDao<Facility> implements IFacilityDao {

}
