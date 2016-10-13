package com.website.lt.web.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.website.lt.model.News;
import com.website.lt.model.Pager;
import com.website.lt.service.INewsService;

@Controller
@RequestMapping("/index/news")
public class NewsController {
	
	@Autowired
	private INewsService newsService;

	//three pagecontent load data
	@RequestMapping("/companynews")
	public String companyprofile(Model model){
		//about load datas
		Pager<News> p=newsService.find();
		model.addAttribute("pagers",newsService.find());
		return "index/news/companynews";
	}
	
	//three pagecontent load data
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable int id,Model model){
		//about load datas
		model.addAttribute("p",newsService.load(id));
		return "index/news/detail";
	}
}
