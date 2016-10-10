package com.website.lt.web.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.website.lt.service.IPageContentService;

@Controller
@RequestMapping("/index/contact")
public class Contact {

	@Autowired
	private IPageContentService pageContentService;
	
	
	// pagecontent load data
	@RequestMapping("/location")
	public String location(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(6));
		return "index/contact/location";
	}
	
	
	// feedback
	@RequestMapping("/feedback")
	public String feedback(Model model){

		return "index/contact/feedback";
	}
	
	
	//feedback info insert into database 
	
	
}
