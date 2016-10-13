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

import com.website.lt.model.Certification;
import com.website.lt.model.Pager;
import com.website.lt.service.ICertificationService;

@Controller
@RequestMapping("/admin/about/certification")
public class CertificationController {
	@Autowired
	private ICertificationService certificationService;

	//slider list page
	@RequestMapping("/list")
	public String list(){

		return "admin/about/certification/list";
	}
	
	//get Slider List 
	@ResponseBody
	@RequestMapping("getList")
	public Pager<Certification> getList(){
		return certificationService.getPager();
	}
	
	//slider add page
	@RequestMapping("/add")
	public String add(Model model){

		model.addAttribute("t",new Certification());
		
		return "admin/about/certification/add";
	}
	
	//slider add submit
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Model model,Certification t
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
				    	newPath="/resources/upload/certification/"+newName;
					    File f = new File(realpath+newPath);
						FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
					}else{
						model.addAttribute("t",t);
						model.addAttribute("error","image format error!");
						return "/admin/about/certification/add";
					}
				    t.setImgPath(newPath);
		}else{
			model.addAttribute("t",t);
			model.addAttribute("error","image is null!");
		}
		certificationService.add(t);
		return "redirect:list";
		
	}
	
	//slider add page
	@RequestMapping("/update")
	public String update(@RequestParam int id,Model model){
		model.addAttribute("t",certificationService.load(id));
		return "admin/about/certification/update";
	}
	
	//slider update submit
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Model model,Certification newT
			,@RequestParam("attach")MultipartFile attach
			,HttpServletRequest req
			) throws IOException{
		Certification t=certificationService.load(newT.getId());
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
				    	newPath="/resources/upload/certification/"+newName;
					    File f = new File(realpath+newPath);
						FileUtils.copyInputStreamToFile(attach.getInputStream(),f);
					}else{
						model.addAttribute("t",t);
						model.addAttribute("error","image format error!");
						return "/admin/about/certification/add";
					}
				    t.setImgPath(newPath);
		}
		certificationService.update(t);
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
			certificationService.delete(Integer.parseInt(string));
		}
		map.put("sucess","true");
		return map;
	}
}
