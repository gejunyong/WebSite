package com.website.lt.web.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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

import com.website.lt.model.Pager;
import com.website.lt.model.Slider;
import com.website.lt.service.ISliderService;


@Controller
@RequestMapping("/admin/slider")
public class SliderController {
	
	@Autowired
	private ISliderService sliderService;
	
	//slider list page
	@RequestMapping("/list")
	public String list(){

		return "admin/slider/list";
	}
	
	//get Slider List 
	@ResponseBody
	@RequestMapping("getSliderList")
	public Pager<Slider> getBranchList(){
		return sliderService.getSliderList();
	}
	
	//slider add page
	@RequestMapping("/add")
	public String add(Model model){

		model.addAttribute("slider",new Slider());
		
		return "admin/slider/add";
	}
	
	//slider add submit
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Model model,Slider slider
			,@RequestParam("attach")MultipartFile attach
			,HttpServletRequest req
			) throws IOException{
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
				    	newPath="/resources/upload/slider/"+newName;
					    File f = new File(realpath+newPath);
						FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
					}else{
						model.addAttribute("slider",slider);
						model.addAttribute("error","image format error!");
						return "/admin/slider/add";
					}
				    slider.setImgPath(newPath);
		}else{
			model.addAttribute("slider",slider);
			model.addAttribute("error","image is null!");
		}
		sliderService.addSlider(slider);
		return "redirect:list";
		
	}
	
	//slider add page
	@RequestMapping("/update")
	public String udpate(@RequestParam int id,Model model){
		model.addAttribute("slider",sliderService.loadSlider(id));
		return "admin/slider/update";
	}
	
	//slider update submit
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String udpate(Model model,Slider newSlider
			,@RequestParam("attach")MultipartFile attach
			,HttpServletRequest req
			) throws IOException{
		Slider slider=sliderService.loadSlider(newSlider.getId());
		slider.setImgUrl(newSlider.getImgUrl());
		slider.setSortId(newSlider.getSortId());
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
				    	newPath="/resources/upload/slider/"+newName;
					    File f = new File(realpath+newPath);
						FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
					}else{
						model.addAttribute("slider",slider);
						model.addAttribute("error","image format error!");
						return "/admin/slider/add";
					}
				    slider.setImgPath(newPath);
		}
		sliderService.updateSlider(slider);
		return "redirect:/admin/slider/list";
	}
	
	//slider delete 
	//删除
	@ResponseBody
	@RequestMapping(value="/delete")
	public Map delete(@RequestParam String id){
		Map map=new HashMap();
		String[] str=id.split(",");
		for (String string : str) {
			sliderService.deleteSlider(Integer.parseInt(string));
		}
		map.put("sucess","true");
		return map;
	}
	
}
