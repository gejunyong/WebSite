package com.website.lt.web.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.website.lt.model.PageContent;
import com.website.lt.service.IPageContentService;

@Controller
@RequestMapping("/admin/contact")
public class ContactController {
	@Autowired
	private IPageContentService pageContentService;
	
	// pagecontent load data
	@RequestMapping("/location")
	public String location(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(6));
		return "admin/contact/location";
	}
	//update
	@RequestMapping(value="/location",method=RequestMethod.POST)
	public String locationUpdate(Model model,PageContent p){
		//about load datas
		PageContent pu= pageContentService.load(6);
		pu.setContent(p.getContent());
		pageContentService.update(pu);
		model.addAttribute("p",pu);
		return "admin/contact/location";
	}
}
