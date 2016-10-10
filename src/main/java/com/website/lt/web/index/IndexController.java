package com.website.lt.web.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.website.lt.service.ISliderService;

@Controller
public class IndexController {
	@Autowired
	private ISliderService sliderService;
	
	@RequestMapping(value={"/","/index"})
	public String index(Model model){
		//index load datas
		
		model.addAttribute("sliders",sliderService.getSliderShow());
		return "index/index";
	}
}
