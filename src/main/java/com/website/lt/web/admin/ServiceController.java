package com.website.lt.web.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.website.lt.model.PageContent;
import com.website.lt.service.IPageContentService;

@Controller
@RequestMapping("/admin/service")
public class ServiceController {
	@Autowired
	private IPageContentService pageContentService;
	
	// pagecontent load data
	@RequestMapping("/salesmap")
	public String salesmap(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(4));
		return "admin/service/salesmap";
	}
	//update
	@RequestMapping(value="/salesmap",method=RequestMethod.POST)
	public String salesmapUpdate(Model model,PageContent p){
		//about load datas
		PageContent pu= pageContentService.load(4);
		pu.setContent(p.getContent());
		pageContentService.update(pu);
		model.addAttribute("p",pu);
		return "admin/service/salesmap";
	}
	
	// pagecontent load data
	@RequestMapping("/serviceteam")
	public String serviceteam(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(5));
		return "admin/service/serviceteam";
	}
	//update
	@RequestMapping(value="/serviceteam",method=RequestMethod.POST)
	public String serviceteamUpdate(Model model,PageContent p){
		//about load datas
		PageContent pu= pageContentService.load(5);
		pu.setContent(p.getContent());
		pageContentService.update(pu);
		model.addAttribute("p",pu);
		return "admin/service/serviceteam";
	}
}
