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

import com.website.lt.model.Facility;
import com.website.lt.model.Pager;
import com.website.lt.service.IFacilityService;

@Controller
@RequestMapping("/admin/about/facility")
public class FacilityController {
	@Autowired
	private IFacilityService facilityService;
	
		//slider list page
		@RequestMapping("/list")
		public String list(){

			return "admin/about/facility/list";
		}
		
		//get Slider List 
		@ResponseBody
		@RequestMapping("getList")
		public Pager<Facility> getBranchList(){
			return facilityService.getPager();
		}
		
		//slider add page
		@RequestMapping("/add")
		public String add(Model model){

			model.addAttribute("t",new Facility());
			return "admin/about/facility/add";
		}
		
		//slider add submit
		@RequestMapping(value="/add",method=RequestMethod.POST)
		public String add(Model model,Facility t
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
					    	newPath="/resources/upload/facility/"+newName;
						    File f = new File(realpath+newPath);
							FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
						}else{
							model.addAttribute("t",t);
							model.addAttribute("error","image format error!");
							return "/admin/about/facility/add";
						}
					    t.setImgPath(newPath);
			}else{
				model.addAttribute("t",t);
				model.addAttribute("error","image is null!");
			}
			facilityService.add(t);
			return "redirect:list";
			
		}
		
		//slider add page
		@RequestMapping("/update")
		public String update(@RequestParam int id,Model model){
			model.addAttribute("t",facilityService.load(id));
			return "admin/about/facility/update";
		}
		
		//slider update submit
		@RequestMapping(value="/update",method=RequestMethod.POST)
		public String update(Model model,Facility newT
				,@RequestParam("attach")MultipartFile attach
				,HttpServletRequest req
				) throws IOException{
			Facility t=facilityService.load(newT.getId());
			t.setSortId(newT.getSortId());
			t.setImgName(newT.getImgName());
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
					    	newPath="/resources/upload/facility/"+newName;
						    File f = new File(realpath+newPath);
							FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
						}else{
							model.addAttribute("t",t);
							model.addAttribute("error","image format error!");
							return "/admin/about/facility/add";
						}
					    t.setImgPath(newPath);
			}
			facilityService.update(t);
			return "redirect:list";
		}
		
		//slider delete 
		//删除
		@ResponseBody
		@RequestMapping(value="/delete")
		public Map delete(@RequestParam String id){
			Map map=new HashMap();
			String[] str=id.split(",");
			for (String string : str) {
				facilityService.delete(Integer.parseInt(string));
			}
			map.put("sucess","true");
			return map;
		}
}
