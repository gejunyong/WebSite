package com.website.lt.web.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.website.lt.model.PageContent;
import com.website.lt.service.IPageContentService;

@Controller
@RequestMapping("/index/about")
public class AboutController {

	@Autowired
	private IPageContentService pageContentService;
	
	
	//three pagecontent load data
	@RequestMapping("/companyprofile")
	public String companyprofile(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(1));
		return "index/about/companyprofile";
	}
	
	@RequestMapping("/ourculture")
	public String ourculture(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(2));
		return "index/about/ourculture";
	}
	
	@RequestMapping("/businesscustomers")
	public String businesscustomers(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(3));
		return "index/about/businesscustomers";
	}
	
}
