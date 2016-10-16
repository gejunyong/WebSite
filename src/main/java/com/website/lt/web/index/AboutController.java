package com.website.lt.web.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.website.lt.model.PageContent;
import com.website.lt.service.ICategoryService;
import com.website.lt.service.ICertificationService;
import com.website.lt.service.IFacilityService;
import com.website.lt.service.IPageContentService;

@Controller
@RequestMapping("/index/about")
public class AboutController {

	@Autowired
	private IPageContentService pageContentService;
	@Autowired
	private ICertificationService certificationService;
	@Autowired
	private IFacilityService facilityService;
	@Autowired
	private ICategoryService categoryService;
	
	
	//three pagecontent load data
	@RequestMapping("/companyprofile")
	public String companyprofile(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(1));
		model.addAttribute("categorys",categoryService.list(2));
		return "index/about/companyprofile";
	}
	
	@RequestMapping("/ourculture")
	public String ourculture(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(2));
		model.addAttribute("categorys",categoryService.list(2));
		return "index/about/ourculture";
	}
	
	@RequestMapping("/businesscustomers")
	public String businesscustomers(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(3));
		model.addAttribute("categorys",categoryService.list(2));
		return "index/about/businesscustomers";
	}
	
	@RequestMapping("/facility")
	public String facility(Model model){
		//about load datas
		model.addAttribute("p",facilityService.getList());
		model.addAttribute("categorys",categoryService.list(2));
		return "index/about/facility";
	}
	
	@RequestMapping("/certification")
	public String certification(Model model){
		//about load datas
		model.addAttribute("p",certificationService.getList());
		model.addAttribute("categorys",categoryService.list(2));
		return "index/about/certification";
	}
	
	
}
