package com.website.lt.web.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.website.lt.model.Category;
import com.website.lt.model.News;
import com.website.lt.model.Pager;
import com.website.lt.model.Products;
import com.website.lt.service.ICategoryService;
import com.website.lt.service.IProductsService;

@Controller
@RequestMapping("/admin/products/products")
public class AdminProductsController {
	@Autowired
	private IProductsService productsService;
	@Autowired
	private ICategoryService categoryService;
	
			//list page
			@RequestMapping("/list")
			public String list(){

				return "admin/products/products/list";
			}
			
			//get List 
			@ResponseBody
			@RequestMapping("/getList")
			public Pager<Products> getList(){
				return productsService.find();
			}
			
			//add page
			@RequestMapping("/add")
			public String add(Model model){
				Products t=new Products();
				t.setpId(0);
				model.addAttribute("t",t);
				return "admin/products/products/add";
			}
			
			//slider add submit
			@RequestMapping(value="/add",method=RequestMethod.POST)
			public String add(Model model,Products t
					,@RequestParam("attach")MultipartFile attach
					,HttpServletRequest req
					) throws IOException{
				Category typeT=categoryService.load(t.getpId());
					if(typeT.getpId()<=1){
						model.addAttribute("nodeerror","can not add this pid products!");
						model.addAttribute("t",t);
						return "/admin/products/products/add";
					}
				
				//rename image
				SimpleDateFormat sdf  =   new  SimpleDateFormat( "yyyyMMddHHmmssSSS"); 
				String realpath = req.getSession().getServletContext().getRealPath("");
				//System.out.println(realpath);
				String oldName=attach.getOriginalFilename();
				String newName="";
				String newPath="";
				if(!attach.isEmpty()){
						    String ext = oldName.substring(oldName.lastIndexOf("."),oldName.length()).toLowerCase();
						    //image format error
						    if(ext.equals(".jpg")||ext.equals(".png")||ext.equals(".gif")){
						    	newName=sdf.format(new Date())+ext;
						    	newPath="/resources/upload/products/"+newName;
							    File f = new File(realpath+newPath);
								FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
							}else{
								model.addAttribute("t",t);
								model.addAttribute("error","image format error!");
								return "/admin/products/products/add";
							}
						    t.setImgPath(newPath);
				}else{
					model.addAttribute("t",t);
					model.addAttribute("error","image is null!");
				}
				productsService.add(t);
				return "redirect:list";
				
			}
			
			//slider add page
			@RequestMapping("/update")
			public String update(@RequestParam int id,Model model){
				model.addAttribute("t",productsService.load(id));
				return "admin/products/products/update";
			}
			
			//slider update submit
			@RequestMapping(value="/update",method=RequestMethod.POST)
			public String update(Model model,Products newT
					,@RequestParam("attach")MultipartFile attach
					,HttpServletRequest req
					) throws IOException{
				Category typeT=categoryService.load(newT.getpId());
				if(typeT.getpId()<=1){
					model.addAttribute("nodeerror","can not add this pid products!");
					model.addAttribute("t",newT);
					return "/admin/products/products/update";
				}
				
				Products t=productsService.load(newT.getId());
				t.setpId(newT.getpId());
				t.setTitle(newT.getTitle());
				t.setContent(newT.getContent());
				//rename image
				SimpleDateFormat sdf  =   new  SimpleDateFormat( "yyyyMMddHHmmssSSS"); 
				String realpath = req.getSession().getServletContext().getRealPath("");
				//System.out.println(realpath);
				String oldName=attach.getOriginalFilename();
				String newName="";
				String newPath="";
				if(!attach.isEmpty()){
						    String ext = oldName.substring(oldName.lastIndexOf("."),oldName.length()).toLowerCase();
						    //image format error
						    if(ext.equals(".jpg")||ext.equals(".png")||ext.equals(".gif")){
						    	newName=sdf.format(new Date())+ext;
						    	newPath="/resources/upload/products/"+newName;
							    File f = new File(realpath+newPath);
								FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
							}else{
								model.addAttribute("t",t);
								model.addAttribute("error","image format error!");
								return "/admin/products/products/add";
							}
						    t.setImgPath(newPath);
				}
				productsService.update(t);
				return "redirect:list";
			}		
			//delete 
			@ResponseBody
			@RequestMapping(value="/delete")
			public Map delete(@RequestParam String id){
				Map map=new HashMap();
				String[] str=id.split(",");
				for (String string : str) {
					productsService.delete(Integer.parseInt(string));
				}
				map.put("sucess","true");
				return map;
			}
}
