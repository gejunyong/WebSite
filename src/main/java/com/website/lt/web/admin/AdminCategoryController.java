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
import com.website.lt.model.Certification;
import com.website.lt.service.ICategoryService;

@Controller
@RequestMapping("/admin/products/category")
public class AdminCategoryController {
	@Autowired
	private ICategoryService categoryService;
	
	//list page
	@RequestMapping("/list")
	public String list(Model model){
		
		model.addAttribute("list",categoryService.list());
		return "admin/products/category/list";
	}
	
	//get List 
	@ResponseBody
	@RequestMapping("/getList")
	public List<Category> getList(){
		return categoryService.list();
	}
	
	//slider add page
	@RequestMapping("/add")
	public String add(Model model,@RequestParam int pid){

		Category t=new Category();
		t.setpId(pid);
		model.addAttribute("t",t);
		model.addAttribute("categorys",categoryService.list(0));
		return "admin/products/category/add";
	}
	
	//slider add submit
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Model model,Category t
			,@RequestParam("attach")MultipartFile attach
			,HttpServletRequest req
			) throws IOException{
		Category typeT=categoryService.load(t.getpId());
			if(typeT.getpId()>1){
				model.addAttribute("nodeerror","can not add next level node!");
				return "/admin/products/category/add";
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
				    	newPath="/resources/upload/category/"+newName;
					    File f = new File(realpath+newPath);
						FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
					}else{
						model.addAttribute("t",t);
						model.addAttribute("error","image format error!");
						return "/admin/products/category/add";
					}
				    t.setImgPath(newPath);
		}else{
			model.addAttribute("t",t);
			model.addAttribute("error","image is null!");
		}
		categoryService.add(t);
		return "redirect:list";
		
	}
	
	//slider add page
	@RequestMapping("/update")
	public String update(@RequestParam int id,Model model){
		model.addAttribute("t",categoryService.load(id));
		model.addAttribute("categorys",categoryService.list(0));
		return "admin/products/category/update";
	}
	
	//slider update submit
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Model model,Category newT
			,@RequestParam("attach")MultipartFile attach
			,HttpServletRequest req
			) throws IOException{
		Category t=categoryService.load(newT.getId());
		t.setpId(newT.getpId());
		t.setName(newT.getName());
		t.setSortId(newT.getSortId());
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
				    	newPath="/resources/upload/category/"+newName;
					    File f = new File(realpath+newPath);
						FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
					}else{
						model.addAttribute("t",t);
						model.addAttribute("error","image format error!");
						return "/admin/products/category/add";
					}
				    t.setImgPath(newPath);
		}
		categoryService.update(t);
		return "redirect:list";
	}
	
	// delete 
	@RequestMapping(value="/delete")
	public String delete(@RequestParam String id,Model model){
		Map map=new HashMap();
		if(Integer.parseInt(id)==1){
			//can not delete root
			model.addAttribute("error","can not delete root node");
			return "admin/products/category/list";
		}
		categoryService.delete(Integer.parseInt(id));
		return "admin/products/category/list";
	}
}
