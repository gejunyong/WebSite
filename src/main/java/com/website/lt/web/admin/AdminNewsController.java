package com.website.lt.web.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.website.lt.model.News;
import com.website.lt.model.Pager;
import com.website.lt.service.INewsService;

@Controller
@RequestMapping("/admin/news/companynews")
public class AdminNewsController {
	
	@Autowired
	private INewsService newsService;
	
			//list page
			@RequestMapping("/list")
			public String list(){

				return "admin/news/companynews/list";
			}
			
			//get List 
			@ResponseBody
			@RequestMapping("/getList")
			public Pager<News> getList(){
				return newsService.find();
			}
			
			//add page
			@RequestMapping("/add")
			public String add(Model model){

				model.addAttribute("t",new News());
				return "admin/news/companynews/add";
			}
			
			//add submit
			@RequestMapping(value="/add",method=RequestMethod.POST)
			public String add(Model model,News t){
				//rename image
				SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd"); 
				//System.out.println(realpath);
				t.setCreateDate(sdf.format(new Date()));
				newsService.add(t);
				return "redirect:list";
				
			}
			
			// add page
			@RequestMapping("/update")
			public String update(@RequestParam int id,Model model){
				model.addAttribute("t",newsService.load(id));
				return "admin/news/companynews/update";
			}
			
			//update submit
			@RequestMapping(value="/update",method=RequestMethod.POST)
			public String update(Model model,News newT){
				News t=newsService.load(newT.getId());
				t.setContent(newT.getContent());;
				t.setTitle(newT.getTitle());
				newsService.update(t);
				return "redirect:list";
			}
			
			//delete 
			@ResponseBody
			@RequestMapping(value="/delete")
			public Map delete(@RequestParam String id){
				Map map=new HashMap();
				String[] str=id.split(",");
				for (String string : str) {
					newsService.delete(Integer.parseInt(string));
				}
				map.put("sucess","true");
				return map;
			}
	
}
