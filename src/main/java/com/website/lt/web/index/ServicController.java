package com.website.lt.web.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.website.lt.service.IPageContentService;

@Controller
@RequestMapping("/index/service")
public class ServicController {
	
	@Autowired
	private IPageContentService pageContentService;
	
	
	//two pagecontent load data
	@RequestMapping("/salesmap")
	public String salesmap(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(4));
		return "index/service/salesmap";
	}
	
	@RequestMapping("/serviceteam")
	public String ourculture(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(5));
		return "index/service/serviceteam";
	}
	
}
