package com.website.lt.web.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.website.lt.model.Category;
import com.website.lt.model.News;
import com.website.lt.model.Pager;
import com.website.lt.model.Products;
import com.website.lt.service.ICategoryService;
import com.website.lt.service.IProductsService;

@Controller
@RequestMapping("/index/products")
public class ProductsController {
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IProductsService productsService;
	
	//three pagecontent load data
		@RequestMapping("/categorys")
		public String category(Model model){
			//about load datas
			model.addAttribute("cur",categoryService.load(1));
			List<Category> p=categoryService.list(2);
			model.addAttribute("categorys",p);
			model.addAttribute("ps",p);
			return "index/products/categorys";
		}
		
		//three pagecontent load data
		@RequestMapping("/categorys/{pid}")
		public String cList(@PathVariable int pid,Model model){
			//about load datas
			model.addAttribute("cur",categoryService.load(pid));
			model.addAttribute("ps",categoryService.cList(pid));
			model.addAttribute("categorys",categoryService.list(2));
			return "index/products/categorys";
		}
		
		//three pagecontent load data
		@RequestMapping("/products/{pid}")
		public String pList(@PathVariable int pid,Model model){
			Category c= categoryService.load(pid);
			model.addAttribute("cur",categoryService.load(c.getpId()));
			//about load datas
			model.addAttribute("ps",productsService.list(pid));
			model.addAttribute("categorys",categoryService.list(2));
			return "index/products/products";
		}
		
		//three pagecontent load data
		@RequestMapping("/detail/{id}")
		public String detail(@PathVariable int id,Model model){
			
			Products p= productsService.load(id);
			model.addAttribute("p",p);
			
			Category c= categoryService.load(p.getpId());
			model.addAttribute("cur",categoryService.load(c.getpId()));
			
			model.addAttribute("categorys",categoryService.list(2));
			return "index/products/detail";
		}
		
	
		//three pagecontent load data
		@RequestMapping("/search")
		public String searchList(@RequestParam String key,Model model){

			model.addAttribute("cur",categoryService.load(1));
			//about load datas
			model.addAttribute("ps",productsService.searchList(key));
			model.addAttribute("categorys",categoryService.list(2));
			return "index/products/search";
		}
}
