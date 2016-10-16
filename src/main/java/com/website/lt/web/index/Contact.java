package com.website.lt.web.index;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.website.lt.model.Inquiry;
import com.website.lt.service.ICategoryService;
import com.website.lt.service.IInquiryService;
import com.website.lt.service.IPageContentService;

@Controller
@RequestMapping("/index/contact")
public class Contact {

	@Autowired
	private IPageContentService pageContentService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IInquiryService inquiryService;

	// pagecontent load data
	@RequestMapping("/location")
	public String location(Model model){
		//about load datas
		model.addAttribute("p",pageContentService.load(6));
		model.addAttribute("categorys",categoryService.list(2));
		return "index/contact/location";
	}
	
	
	// feedback
	@RequestMapping("/feedback")
	public String feedback(Model model){
		model.addAttribute("inquiry",new Inquiry());
		model.addAttribute("categorys",categoryService.list(2));
		return "index/contact/feedback";
	}
	
	
	//feedback info insert into database 
	@RequestMapping(value="/feedback",method=RequestMethod.POST)
	public String feedback(Inquiry inquiry,Model model){
		SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd"); 
		//System.out.println(realpath);
		inquiry.setCreateDate(sdf.format(new Date()));
		inquiryService.add(inquiry);
		model.addAttribute("categorys",categoryService.list(2));
		return "redirect:success";
	}
	
	// feedback
	@RequestMapping("/success")
	public String success(Model model){
		model.addAttribute("categorys",categoryService.list(2));
		return "index/contact/success";
	}
	
}
