package com.website.lt.web.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.website.lt.model.Inquiry;
import com.website.lt.model.Pager;
import com.website.lt.model.Products;
import com.website.lt.service.IInquiryService;
import com.website.lt.service.IProductsService;

@Controller
@RequestMapping("/admin/contact")
public class InquiryController {
	
	@Autowired
	private IInquiryService inquiryService;
	@Autowired
	private IProductsService productsService;
			// page
			@RequestMapping("/feedback")
			public String list(){
				
				return "admin/contact/feedback";
			}
			
			//get List 
			@ResponseBody
			@RequestMapping("getList")
			public Pager<Inquiry> getList(){
				return inquiryService.find();
			}
			
			//get List 
			@ResponseBody
			@RequestMapping("getProducts")
			public List<Products> getProducts(@RequestParam int id){
				Inquiry inquiry=inquiryService.load(id);
			  	String sql="";
				if(inquiry.getInqProducts()!=null
						&&!inquiry.getInqProducts().isEmpty()
						&&!inquiry.getInqProducts().equals("")){
					sql=inquiry.getInqProducts().substring(0,inquiry.getInqProducts().length()-1);
					return productsService.enqPList(sql);
				}
				return null;
			}
			
}
