package com.website.lt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.lt.dao.ISliderDao;
import com.website.lt.model.Pager;
import com.website.lt.model.Slider;
import com.website.lt.service.ISliderService;

@Service("sliderService")
public class SliderService implements ISliderService {
	
	@Autowired
	private ISliderDao sliderDao;

	@Override
	public Pager<Slider> getSliderList() {
		return sliderDao.find(" from Slider order by sortId ");
	}

	@Override
	public void addSlider(Slider slider) {
		sliderDao.add(slider);
	}

	@Override
	public void updateSlider(Slider slider) {
		sliderDao.update(slider);
	}

	@Override
	public void deleteSlider(int id) {
		sliderDao.delete(id);
	}

	@Override
	public Slider loadSlider(int id) {
		return sliderDao.load(id);
	}

	@Override
	public List<Slider> getSliderShow() {
		return sliderDao.list(" from Slider order by sortId  ");
	}
	
	

}
