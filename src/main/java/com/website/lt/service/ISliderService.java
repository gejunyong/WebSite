package com.website.lt.service;

import java.util.List;

import com.website.lt.model.Pager;
import com.website.lt.model.Slider;

public interface ISliderService {

	public Pager<Slider> getSliderList();

	public void addSlider(Slider slider);
	
	public void updateSlider(Slider slider);
	
	public void deleteSlider(int id);
	
	public Slider loadSlider(int id);
	
	public List<Slider> getSliderShow();
}
