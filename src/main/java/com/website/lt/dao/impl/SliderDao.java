package com.website.lt.dao.impl;

import org.springframework.stereotype.Repository;

import com.website.lt.dao.ISliderDao;
import com.website.lt.model.Slider;

@Repository("sliderDao")
public class SliderDao extends BaseDao<Slider> implements ISliderDao{

}
