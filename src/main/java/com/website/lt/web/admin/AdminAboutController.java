package com.website.lt.web.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.opensymphony.module.sitemesh.Page;
import com.website.lt.model.PageContent;
import com.website.lt.service.IPageContentService;

@Controller
@RequestMapping("/admin/about")
public class AdminAboutController {
	
	@Autowired
	private IPageContentService pageContentService;
	
	//three pagecontent load data
	@RequestMapping("/companyprofile")
	public String companyprofile(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(1));
		return "admin/about/companyprofile";
	}
	//update
	@RequestMapping(value="/companyprofile",method=RequestMethod.POST)
	public String companyprofileUpdate(Model model,PageContent p){
		//about load datas
		PageContent pu= pageContentService.load(1);
		pu.setContent(p.getContent());
		pageContentService.update(pu);
		model.addAttribute("p",pu);
		return "redirect:companyprofile";
	}
	
	
	@RequestMapping("/ourculture")
	public String ourculture(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(2));
		return "admin/about/ourculture";
	}
	//update
	@RequestMapping(value="/ourculture",method=RequestMethod.POST)
	public String ourcultureUpdate(Model model,PageContent p){
		//about load datas
		PageContent pu= pageContentService.load(2);
		pu.setContent(p.getContent());
		pageContentService.update(pu);
		model.addAttribute("p",pu);
		return "redirect:ourculture";
	}
	
	
	@RequestMapping("/businesscustomers")
	public String businesscustomers(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(3));
		return "admin/about/businesscustomers";
	}
	//update
	@RequestMapping(value="/businesscustomers",method=RequestMethod.POST)
	public String businesscustomersUpdate(Model model,PageContent p){
		//about load datas
		PageContent pu= pageContentService.load(3);
		pu.setContent(p.getContent());
		pageContentService.update(pu);
		model.addAttribute("p",pu);
		return "redirect:businesscustomers";
	}
}
